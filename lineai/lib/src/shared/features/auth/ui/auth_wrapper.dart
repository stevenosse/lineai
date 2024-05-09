import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/features/chats/chat_cubit.dart';

@RoutePage(name: 'AuthRoute')
class AuthWrapper extends StatelessWidget implements AutoRouteWrapper {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }

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
