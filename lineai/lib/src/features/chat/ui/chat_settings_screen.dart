import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

@RoutePage()
class ChatSettingsScreen extends StatefulWidget {
  const ChatSettingsScreen({super.key});

  @override
  State<ChatSettingsScreen> createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatSettingsScreen> {
  final _systemPromptController = TextEditingController();

  @override
  void dispose() {
    _systemPromptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: I18n.of(context).chatSettings_title,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              I18n.of(context).chatSettings_modelLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Wrap(
              spacing: Dimens.halfSpacing,
              runSpacing: Dimens.spacing,
              children: [
                ...['mixtral', 'gemma', 'llama'].map(
                  (e) => ChoiceChip(label: Text(e), selected: e == 'gemma'),
                ),
              ],
            ),
            const Gap.vertical(height: Dimens.spacing),
            Text(
              I18n.of(context).chatSettings_systemPromptLabel,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Gap.vertical(height: Dimens.minSpacing),
            Input(
              controller: _systemPromptController,
              isBorderless: true,
              fillColor: context.colorScheme.surface,
              hintText: I18n.of(context).chatSettings_systemPromptHint,
              filled: true,
              minLines: 4,
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}