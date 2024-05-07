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
import 'package:lineai/src/features/login/logic/login_cubit.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/labeled_divider.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
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
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: (email, password) => LoadingDialog.show(context: context),
          error: (email, password, error) {
            LoadingDialog.hide(context: context);
            ApiErrorDialog.show(context: context, error: error);
          },
          success: (email, password, response) {
            LoadingDialog.hide(context: context);
            FocusManager.instance.primaryFocus?.unfocus();
            context.router.replaceAll([const ChatHomeRoute()]);
          },
          orElse: () => LoadingDialog.hide(context: context),
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(Dimens.spacing),
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
                I18n.of(context).login_title,
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Gap.vertical(height: Dimens.minSpacing),
              Text(I18n.of(context).login_subtitle, style: context.textTheme.bodyMedium),
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
                        labelText: I18n.of(context).login_emailLabel,
                        hintText: I18n.of(context).login_emailHint,
                        onChanged: context.read<LoginCubit>().onEmailChanged,
                        validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                            .email(I18n.of(context).formInput_emailValidation)
                            .required(I18n.of(context).formInput_required)
                            .build(),
                        textInputAction: TextInputAction.next,
                      ),
                      const Gap.vertical(height: Dimens.spacing),
                      Input(
                        autofillHints: const [AutofillHints.password],
                        controller: _passwordController,
                        isPassword: true,
                        labelText: I18n.of(context).login_passwordLabel,
                        hintText: I18n.of(context).login_passwordHint,
                        onChanged: context.read<LoginCubit>().onPasswordChanged,
                        validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                            .minLength(8, I18n.of(context).formInput_passwordValidation)
                            .required(I18n.of(context).formInput_required)
                            .build(),
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _onLogin(),
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
                  child: Text(I18n.of(context).login_forgotPasswordLabel),
                ),
              ),
              const Gap.vertical(height: Dimens.spacing),
              Button.primary(
                title: I18n.of(context).login_btnLabel,
                onPressed: _onLogin,
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
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      context.read<LoginCubit>().login();
    }
  }
}
