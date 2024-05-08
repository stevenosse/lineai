import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/features/chats/chat_cubit.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  return ListView(
                    padding: const EdgeInsets.all(Dimens.spacing),
                    children: [
                      Text(
                        I18n.of(context).chatSettings_modelLabel,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap.vertical(height: Dimens.minSpacing),
                      Wrap(
                        spacing: Dimens.halfSpacing,
                        runSpacing: Dimens.halfSpacing,
                        children: [
                          ...AIConstants.models.map(
                            (e) => ChoiceChip(
                              label: Text(e),
                              selected: e == state.conversation?.model,
                              onSelected: (_) => context.read<ChatCubit>().onModelChanged(e),
                            ),
                          ),
                        ],
                      ),
                      const Gap.vertical(height: Dimens.doubleSpacing),
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
                        onChanged: context.read<ChatCubit>().onSystemPromptChanged,
                      ),
                      const Gap.vertical(height: Dimens.doubleSpacing),
                      Text(
                        I18n.of(context).chatSettings_temperatureLabel,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Gap.vertical(height: Dimens.minSpacing),
                      Slider(
                        value: state.conversation?.temperature ?? 1.0,
                        min: 0,
                        max: 2,
                        divisions: 100,
                        label: state.conversation?.temperature.toStringAsFixed(1),
                        onChanged: context.read<ChatCubit>().onTemperatureChanged,
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.spacing) +
                  const EdgeInsets.only(bottom: Dimens.spacing),
              child: Button.neutral(
                title: I18n.of(context).save,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
