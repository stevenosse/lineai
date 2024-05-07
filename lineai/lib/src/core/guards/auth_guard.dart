import 'package:auto_route/auto_route.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = Supabase.instance.client.auth.currentSession?.user;

    if (user == null) {
      router.navigate(const LoginRoute());
      return;
    }

    resolver.next();
  }
}
