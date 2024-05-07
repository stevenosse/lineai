import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

final class DrawerEntry {
  final PreferredSizeWidget appBar;
  final PageRouteInfo route;

  const DrawerEntry({required this.appBar, required this.route});
}
