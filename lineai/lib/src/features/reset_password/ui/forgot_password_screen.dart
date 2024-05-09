import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/reset_password/logic/forgot_password/forgot_password_cubit.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/utils/notifications_service.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget implements AutoRouteWrapper {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordCubit(),
      child: this,
    );
  }
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (email) => LoadingDialog.show(context: context),
          error: (email, error) {
            LoadingDialog.hide(context: context);
            ApiErrorDialog.show(context: context, error: error);
          },
          success: (email) {
            LoadingDialog.hide(context: context);
            $notificationService.showSuccessNotification(
              context: context,
              body: I18n.of(context).forgotPassword_successMessage,
            );
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
              I18n.of(context).forgotPassword_title,
              style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Text(I18n.of(context).forgotPassword_subtitle, style: context.textTheme.bodyMedium),
            const Gap.vertical(height: Dimens.doubleSpacing),
            AutofillGroup(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Input(
                      autofillHints: const [AutofillHints.email],
                      controller: _emailController,
                      labelText: I18n.of(context).login_emailLabel,
                      hintText: I18n.of(context).login_emailHint,
                      onChanged: context.read<ForgotPasswordCubit>().onEmailChanged,
                      validator: ValidationBuilder(requiredMessage: I18n.of(context).formInput_required)
                          .email(I18n.of(context).formInput_emailValidation)
                          .required(I18n.of(context).formInput_required)
                          .build(),
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
              ),
            ),
            const Gap.vertical(height: Dimens.spacing),
            Button.primary(
              onPressed: _onSubmit,
              title: I18n.of(context).forgotPassword_submitButton,
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ForgotPasswordCubit>().submit();
    }
  }
}
