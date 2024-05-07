import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

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
            ),
          ],
        ),
      ),
    );
  }
}
