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
import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/features/register/logic/register_cubit.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
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
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: this,
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: (email, password) => LoadingDialog.show(context: context),
          error: (email, password, error) {
            LoadingDialog.hide(context: context);
            ApiErrorDialog.show(context: context, error: error);
          },
          success: (email, password, response) {
            LoadingDialog.hide(context: context);
            context.router.replace(const ChatHomeRoute());
          },
          orElse: () => LoadingDialog.hide(context: context),
        );
      },
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
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
                              onChanged: context.read<RegisterCubit>().onEmailChanged,
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
                              labelText: I18n.of(context).register_passwordLabel,
                              hintText: I18n.of(context).register_passwordHint,
                              onChanged: context.read<RegisterCubit>().onPasswordChanged,
                              validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                                  .minLength(
                                      AppConstants.minPasswordLength, I18n.of(context).formInput_passwordValidation)
                                  .required(I18n.of(context).formInput_required)
                                  .build(),
                              textInputAction: TextInputAction.done,
                              suffixIcon: IconButton(
                                onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                                icon: Icon(
                                  _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                              onSubmitted: (value) => _onRegister(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap.vertical(height: Dimens.spacing),
                    Button.primary(
                      title: I18n.of(context).register_btnLabel,
                      onPressed: _onRegister,
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
                      onPressed: () {},
                    ),
                    const Gap.vertical(height: Dimens.spacing),
                    Button.outline(
                      icon: SvgPicture.asset(
                        Assets.images.appleLogo,
                        colorFilter: ColorFilter.mode(context.colorScheme.onBackground, BlendMode.srcIn),
                        width: Dimens.iconSize,
                        height: Dimens.iconSize,
                      ),
                      title: I18n.of(context).register_appleBtnLabel,
                      onPressed: () {},
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
      ),
    );
  }

  void _onRegister() {
    if (_formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      context.read<RegisterCubit>().register();
    }
  }
}
