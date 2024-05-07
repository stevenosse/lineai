import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/environment.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/drawer_navigation/models/drawer_entry.dart';
import 'package:lineai/src/features/drawer_navigation/ui/components/drawer_menu.dart';

@RoutePage(name: 'DrawerRoute')
class DrawerWrapper extends StatefulWidget {
  const DrawerWrapper({super.key});

  @override
  State<DrawerWrapper> createState() => _DrawerWrapperState();
}

class _DrawerWrapperState extends State<DrawerWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final entries = <DrawerEntry>[
    DrawerEntry(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(IconsaxPlusBroken.menu_1),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        centerTitle: true,
        title: Text(
          Environment.appName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        actions: [
          IconButton(
            icon: const Icon(IconsaxPlusBroken.edit),
            iconSize: Dimens.iconSizeM,
            onPressed: _onNewChatPressed,
          ),
          IconButton(
            icon: const Icon(IconsaxPlusBroken.setting_2),
            iconSize: Dimens.iconSizeM,
            onPressed: _onSettingsPressed,
          )
        ],
      ),
      route: const ChatHomeRoute(),
    ),
  ];

  List<PageRouteInfo> get routes => entries.map((e) => e.route).toList();

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      scaffoldKey: _scaffoldKey,
      drawer: const DrawerMenu(),
      appBarBuilder: (context, tabsRouter) => entries[tabsRouter.activeIndex].appBar,
      routes: routes,
    );
  }

  void _onNewChatPressed() {}
  void _onSettingsPressed() => context.router.push(const ChatSettingsRoute());
}
