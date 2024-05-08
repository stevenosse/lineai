import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/features/chats/chat_cubit.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage(name: 'AuthRoute')
class AuthWrapper extends StatefulWidget implements AutoRouteWrapper {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => UserSettingsCubit()..getSettings(),
          lazy: false,
          child: this,
        )
      ],
      child: this,
    );
  }
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      if (event.session == null) {
        context.router.replaceAll([const WelcomeRoute()]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
