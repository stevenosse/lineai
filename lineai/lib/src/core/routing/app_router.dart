import 'package:auto_route/auto_route.dart';
import 'package:lineai/src/core/guards/auth_guard.dart';
import 'package:lineai/src/features/chat/ui/chat_home_screen.dart';
import 'package:lineai/src/features/chat/ui/chat_settings_screen.dart';
import 'package:lineai/src/features/drawer_navigation/ui/drawer_wrapper.dart';
import 'package:lineai/src/features/login/ui/login_screen.dart';
import 'package:lineai/src/features/profile/ui/profile_screen.dart';
import 'package:lineai/src/features/settings/ui/settings_screen.dart';
import 'package:lineai/src/shared/features/auth/ui/auth_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page, initial: true),
    AutoRoute(
      page: AuthRoute.page,
      guards: [AuthGuard()],
      children: [
        AutoRoute(
          page: DrawerRoute.page,
          initial: true,
          children: [
            AutoRoute(page: ChatHomeRoute.page, initial: true),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: ChatSettingsRoute.page),
        AutoRoute(page: SettingsRoute.page),
      ],
    ),
  ];
}
