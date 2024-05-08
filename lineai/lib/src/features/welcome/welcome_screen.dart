import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: context.screenSize.height,
                width: context.screenSize.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.images.welcomeBackground.path),
                  ),
                ),
              ),
            ),
            const Gap.vertical(height: Dimens.spacing),
            Padding(
              padding: const EdgeInsets.all(Dimens.spacing),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    I18n.of(context).welcome_title,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Text(
                    I18n.of(context).welcome_subtitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Gap.vertical(height: Dimens.doubleSpacing),
                  Button.primary(
                    title: I18n.of(context).welcome_getStarted,
                    onPressed: () => context.router.push(const RegisterRoute()),
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Button.neutral(
                    title: I18n.of(context).welcome_signIn,
                    onPressed: () => context.router.push(const LoginRoute()),
                  ),
                ],
              ),
            ),
            const Gap.vertical(height: Dimens.tripleSpacing),
          ],
        ),
      ),
    );
  }
}
