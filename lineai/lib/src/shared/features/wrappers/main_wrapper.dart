import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage(name: 'MainRoute')
class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  StreamSubscription<AuthState>? _authStateSubscription;

  @override
  void initState() {
    _authStateSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((event) {
      switch (event.event) {
        case AuthChangeEvent.signedOut:
          context.router.replaceAll([const WelcomeRoute()]);
          break;
        case AuthChangeEvent.passwordRecovery:
          context.router.replace(const ResetPasswordRoute());
          break;
        default:
          break;
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
