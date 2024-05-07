import 'package:auto_route/auto_route.dart';
import 'package:lineai/src/features/chat_home/ui/chat_home_screen.dart';
import 'package:lineai/src/features/login/ui/login_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: ChatHomeRoute.page, initial: true),
  ];
}
