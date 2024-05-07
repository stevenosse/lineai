import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/labeled_divider.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap.vertical(height: Dimens.tripleSpacing),
            Text(
              I18n.of(context).login_title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Text(I18n.of(context).login_subtitle, style: context.textTheme.bodyMedium),
            const Gap.vertical(height: Dimens.doubleSpacing),
            Input(
              controller: _emailController,
              labelText: I18n.of(context).login_emailLabel,
              hintText: I18n.of(context).login_emailHint,
            ),
            const Gap.vertical(height: Dimens.spacing),
            Input(
              controller: _passwordController,
              isPassword: true,
              labelText: I18n.of(context).login_passwordLabel,
              hintText: I18n.of(context).login_passwordHint,
            ),
            const Gap.vertical(height: Dimens.spacing),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(I18n.of(context).login_forgotPasswordLabel),
              ),
            ),
            const Gap.vertical(height: Dimens.spacing),
            Button.primary(
              title: I18n.of(context).login_btnLabel,
              onPressed: () => context.router.push(const ChatHomeRoute()),
            ),
            const Gap.vertical(height: Dimens.doubleSpacing),
            LabeledDivider(
              label: I18n.of(context).or,
            ),
            const Gap.vertical(height: Dimens.doubleSpacing),
            Button.outline(
              icon: SvgPicture.asset(
                Assets.images.googleLogo,
                width: Dimens.iconSize,
                height: Dimens.iconSize,
              ),
              title: I18n.of(context).login_googleBtnLabel,
              onPressed: () => context.router.push(const ChatHomeRoute()),
            ),
            const Gap.vertical(height: Dimens.spacing),
            Button.outline(
              icon: SvgPicture.asset(
                Assets.images.appleLogo,
                colorFilter: ColorFilter.mode(context.colorScheme.onBackground, BlendMode.srcIn),
                width: Dimens.iconSize,
                height: Dimens.iconSize,
              ),
              title: I18n.of(context).login_googleBtnLabel,
              onPressed: () => context.router.push(const ChatHomeRoute()),
            ),
            const Spacer(),
            Center(
              child: Text.rich(
                TextSpan(
                  text: I18n.of(context).login_termsLabel,
                  style: context.textTheme.bodySmall,
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: I18n.of(context).login_termsLink,
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Gap.vertical(height: Dimens.doubleSpacing),
          ],
        ),
      ),
    );
  }
}
