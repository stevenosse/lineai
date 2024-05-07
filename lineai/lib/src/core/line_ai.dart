import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/app_theme.dart';
import 'package:lineai/src/shared/locator.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toastification/toastification.dart';

class LineAI extends StatelessWidget {
  final AppRouter _appRouter;
  LineAI({
    super.key,
    AppRouter? appRouter,
  }) : _appRouter = appRouter ?? locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        title: 'LineAI',
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            AutoRouteObserver(),
          ],
        ),
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          I18n.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: I18n.delegate.supportedLocales,
      ),
    );
  }
}
