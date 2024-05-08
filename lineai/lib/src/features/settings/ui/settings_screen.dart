import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/features/settings/logic/user_settings_cubit.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/features/auth/login/logout_controller.dart';

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
              isPassword: true,
              controller: _apiKeyController,
              filled: true,
              isBorderless: true,
              hintText: I18n.of(context).settings_groqApiKeyHint,
              onChanged: (_) => context.read<UserSettingsCubit>().onGroqApiKeyChanged,
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
