import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@RoutePage(name: 'AuthRoute')
class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
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
