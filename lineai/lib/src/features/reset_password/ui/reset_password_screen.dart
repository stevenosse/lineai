import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/routing/app_router.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/features/reset_password/logic/reset_password/reset_password_cubit.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/utils/notifications_service.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: this,
    );
  }
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (password) {
            LoadingDialog.hide(context: context);
            $notificationService.showSuccessNotification(
              context: context,
              body: I18n.of(context).resetPassword_success,
            );
            context.router.navigate(const LoginRoute());
          },
          loading: (password) {
            FocusManager.instance.primaryFocus?.unfocus();
            LoadingDialog.show(context: context);
          },
          error: (_, error) {
            LoadingDialog.hide(context: context);
            ApiErrorDialog.show(context: context, error: error);
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 0),
        body: ListView(
          padding: const EdgeInsets.all(Dimens.spacing),
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
              I18n.of(context).resetPassword_title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Text(I18n.of(context).register_subtitle, style: context.textTheme.bodyMedium),
            const Gap.vertical(height: Dimens.doubleSpacing),
            AutofillGroup(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                      isPassword: !_isPasswordVisible,
                      autofillHints: const [AutofillHints.newPassword],
                      controller: _passwordController,
                      labelText: I18n.of(context).resetPassword_passwordLabel,
                      hintText: I18n.of(context).resetPassword_passwordHint,
                      onChanged: context.read<ResetPasswordCubit>().onPasswordChanged,
                      validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                          .minLength(AppConstants.minPasswordLength)
                          .required(I18n.of(context).formInput_required)
                          .build(),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
                        icon: Icon(
                          _isPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const Gap.vertical(height: Dimens.spacing),
                    Input(
                      isPassword: !_isConfirmPasswordVisible,
                      controller: _confirmPasswordController,
                      autofillHints: const [AutofillHints.newPassword],
                      labelText: I18n.of(context).resetPassword_confirmPasswordLabel,
                      hintText: I18n.of(context).resetPassword_confirmPasswordHint,
                      validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                          .minLength(AppConstants.minPasswordLength)
                          .required(I18n.of(context).formInput_required)
                          .add((value) =>
                              value != _passwordController.text ? I18n.of(context).formInput_passwordsMissMatch : null)
                          .build(),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                        icon: Icon(
                          _isConfirmPasswordVisible ? IconsaxPlusBroken.eye : IconsaxPlusBroken.eye_slash,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _onSubmit(),
                    )
                  ],
                ),
              ),
            ),
            const Gap.vertical(height: Dimens.spacing),
            Button.primary(
              onPressed: _onSubmit,
              title: I18n.of(context).resetPassword_submitButton,
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ResetPasswordCubit>().resetPassword();
    }
  }
}
