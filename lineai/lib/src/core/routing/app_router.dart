import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/guards/auth_guard.dart';
import 'package:lineai/src/core/guards/auth_redirection_guard.dart';
import 'package:lineai/src/features/about/ui/about_screen.dart';
import 'package:lineai/src/features/chat/ui/chat_home_screen.dart';
import 'package:lineai/src/features/chat/ui/chat_settings_screen.dart';
import 'package:lineai/src/features/drawer_navigation/ui/drawer_wrapper.dart';
import 'package:lineai/src/features/login/ui/login_screen.dart';
import 'package:lineai/src/features/register/ui/register_screen.dart';
import 'package:lineai/src/features/reset_password/ui/forgot_password_screen.dart';
import 'package:lineai/src/features/reset_password/ui/reset_password_screen.dart';
import 'package:lineai/src/features/settings/ui/settings_screen.dart';
import 'package:lineai/src/features/welcome/welcome_screen.dart';
import 'package:lineai/src/shared/features/auth/login/logout_controller.dart';
import 'package:lineai/src/shared/features/auth/ui/auth_wrapper.dart';
import 'package:lineai/src/shared/features/wrappers/main_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
      initial: true,
      children: [
        AutoRoute(page: WelcomeRoute.page, guards: [AuthRedirectionGuard()], initial: true),
        AutoRoute(page: LoginRoute.page, guards: [AuthRedirectionGuard()]),
        AutoRoute(page: RegisterRoute.page, guards: [AuthRedirectionGuard()]),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(
          page: AuthRoute.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(
              page: DrawerRoute.page,
              initial: true,
              children: [
                AutoRoute(page: ChatHomeRoute.page, initial: true),
              ],
            ),
            AutoRoute(page: ChatSettingsRoute.page),
            AutoRoute(page: SettingsRoute.page),
            AutoRoute(page: AboutRoute.page),
          ],
        ),
      ],
    ),
  ];
}
