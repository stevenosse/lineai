import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/features/auth/login/logout_controller.dart';
import 'package:lineai/src/shared/utils/notifications.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  SettingsScreen({
    super.key,
    LogoutController? logoutController,
  }) : _logoutController = logoutController ?? LogoutController();

  final LogoutController _logoutController;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _hasUnsavedChanges = false;
  final TextEditingController _apiKeyController = TextEditingController();

  @override
  void dispose() {
    _apiKeyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: I18n.of(context).settings_title),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing),
        child: ListView(
          children: [
            Text(
              I18n.of(context).settings_groqApiKeyLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Input(
              controller: _apiKeyController,
              filled: true,
              isBorderless: true,
              hintText: I18n.of(context).settings_groqApiKeyHint,
              onChanged: (_) {
                context.read<UserSettingsCubit>().onGroqApiKeyChanged(_apiKeyController.text);
                setState(() {
                  _hasUnsavedChanges = true;
                });
              },
              validator: ValidationBuilder().required(I18n.of(context).settings_groqApiKeyRequiredValidation).build(),
            ),
            BlocConsumer<UserSettingsCubit, UserSettingsState>(
              listener: (context, state) {
                state.whenOrNull(
                  error: (settings, error) {
                    LoadingDialog.hide(context: context);
                    $notificationService.showErrorNotification(
                      context: context,
                      body: error.describe(context: context),
                    );
                  },
                  loading: (settings) => LoadingDialog.show(context: context),
                  success: (settings) {
                    LoadingDialog.hide(context: context);
                    setState(() => _hasUnsavedChanges = false);
                    $notificationService.showSuccessNotification(
                      context: context,
                      body: I18n.of(context).settings_groqApiKeySuccess,
                    );
                  },
                );
              },
              builder: (context, state) {
                if (_hasUnsavedChanges) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => context.read<UserSettingsCubit>().saveSettings(),
                        child: Text(I18n.of(context).save),
                      ),
                    ],
                  );
                }
                return const Gap.vertical(height: 0);
              },
            ),
            const Gap.vertical(height: Dimens.doubleSpacing),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                IconsaxPlusBroken.logout,
                color: context.colorScheme.error,
              ),
              title: Text(
                I18n.of(context).settings_logout,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: context.colorScheme.error, fontWeight: FontWeight.w500),
              ),
              onTap: () async => await widget._logoutController.logout(),
            )
          ],
        ),
      ),
    );
  }
}
