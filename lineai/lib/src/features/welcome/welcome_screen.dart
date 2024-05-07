import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/gap.dart';

@RoutePage()
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
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
              onPressed: () => context.router.push(const LoginRoute()),
            ),
            const Gap.vertical(height: Dimens.spacing),
            Button.neutral(
              title: I18n.of(context).welcome_signIn,
              // onPressed: () => context.router.push(const HomeRoute()),
            ),
            const Gap.vertical(height: Dimens.doubleSpacing),
          ],
        ),
      ),
    );
  }
}
