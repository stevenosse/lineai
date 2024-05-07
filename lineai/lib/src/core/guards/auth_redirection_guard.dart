import 'package:auto_route/auto_route.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


/// Guard that redirects user if they are already authenticated
class AuthRedirectionGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = Supabase.instance.client.auth.currentSession?.user;

    if (user == null) {
      resolver.next();
      return;
    }

    router.navigate(const ChatHomeRoute());
  }
}
