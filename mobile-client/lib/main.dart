import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lineai/src/core/app_initializer.dart';
import 'package:lineai/src/core/line_ai.dart';

void main() {
  final AppInitializer appInitializer = AppInitializer();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await appInitializer.preAppRun();

      runApp(LineAI());

      appInitializer.postAppRun();
    },
    (error, stack) {},
  );
}
