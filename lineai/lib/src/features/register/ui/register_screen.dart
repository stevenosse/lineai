import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/gen/assets.gen.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/mappers.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/dialogs/dialog_builder.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/labeled_divider.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget implements AutoRouteWrapper {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
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
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const Gap.vertical(height: Dimens.spacing),
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: () => context.router.maybePop(),
                        icon: Icon(IconsaxPlusBroken.arrow_left_1, color: context.colorScheme.onSurface),
                        style: IconButton.styleFrom(
                          foregroundColor: context.colorScheme.onSurface,
                          backgroundColor: context.colorScheme.surface,
                        ),
                      ),
                    ],
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Text(
                    I18n.of(context).register_title,
                    style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Gap.vertical(height: Dimens.minSpacing),
                  Text(I18n.of(context).register_subtitle, style: context.textTheme.bodyMedium),
                  const Gap.vertical(height: Dimens.doubleSpacing),
                  AutofillGroup(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Input(
                            autofillHints: const [AutofillHints.email],
                            controller: _emailController,
                            labelText: I18n.of(context).register_emailLabel,
                            hintText: I18n.of(context).register_emailHint,
                            // onChanged: context.read<LoginCubit>().onEmailChanged,
                            validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                                .email(I18n.of(context).formInput_emailValidation)
                                .required(I18n.of(context).formInput_required)
                                .build(),
                          ),
                          const Gap.vertical(height: Dimens.spacing),
                          Input(
                            autofillHints: const [AutofillHints.password],
                            controller: _passwordController,
                            isPassword: true,
                            labelText: I18n.of(context).register_passwordLabel,
                            hintText: I18n.of(context).register_passwordHint,
                            // onChanged: context.read<LoginCubit>().onPasswordChanged,
                            validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                                .minLength(8, I18n.of(context).formInput_passwordValidation)
                                .required(I18n.of(context).formInput_required)
                                .build(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(I18n.of(context).register_forgotPasswordLabel),
                    ),
                  ),
                  const Gap.vertical(height: Dimens.spacing),
                  Button.primary(
                    title: I18n.of(context).register_btnLabel,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        // context.read<LoginCubit>().login();
                      }
                    },
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
                    title: I18n.of(context).register_googleBtnLabel,
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
                    title: I18n.of(context).register_googleBtnLabel,
                    onPressed: () => context.router.push(const ChatHomeRoute()),
                  ),
                ],
              ),
            ),
            Center(
              child: Text.rich(
                TextSpan(
                  text: I18n.of(context).register_termsLabel,
                  style: context.textTheme.bodySmall,
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: I18n.of(context).register_termsLink,
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
