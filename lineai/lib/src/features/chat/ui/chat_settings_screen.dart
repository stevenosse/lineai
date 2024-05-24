import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/constants.dart';
import 'package:lineai/src/shared/components/button.dart';
import 'package:lineai/src/shared/components/dialogs/api_error_dialog.dart';
import 'package:lineai/src/shared/components/dialogs/dialog_builder.dart';
import 'package:lineai/src/shared/components/dialogs/loading_dialog.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/components/main_app_bar.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/features/chats/current_chat/chat_cubit.dart';
import 'package:lineai/src/shared/utils/notifications_service.dart';

@RoutePage()
class ChatSettingsScreen extends StatefulWidget {
  const ChatSettingsScreen({super.key});

  @override
  State<ChatSettingsScreen> createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatSettingsScreen> {
  final _systemPromptController = TextEditingController();
  final _conversationNameController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _prefillForm());
    super.initState();
  }

  @override
  void dispose() {
    _systemPromptController.dispose();
    _conversationNameController.dispose();
    super.dispose();
  }

  void _prefillForm() {
    if (context.read<ChatCubit>().state.conversation != null) {
      final conversation = context.read<ChatCubit>().state.conversation;
      _systemPromptController.text = conversation!.systemPrompt;
      _conversationNameController.text = conversation.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: (conversation) => LoadingDialog.show(context: context),
          saved: (conversation, isUpdated) {
            LoadingDialog.hide(context: context);
            if (isUpdated) {
              $notificationService.showSuccessNotification(
                context: context,
                body: I18n.of(context).chatSettings_savedNotification,
              );
            }
          },
          error: (conversation, error) {
            LoadingDialog.hide(context: context);
            ApiErrorDialog.show(context: context, error: error);
          },
        );
      },
      child: Scaffold(
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
                        Input(
                          controller: _conversationNameController,
                          isBorderless: true,
                          hintText: I18n.of(context).chatSettings_conversationTitleHint,
                          labelText: I18n.of(context).chatSettings_conversationTitleLabel,
                          fillColor: context.colorScheme.surface,
                          filled: true,
                          onChanged: context.read<ChatCubit>().onConversationNameChanged,
                        ),
                        const Gap.vertical(height: Dimens.spacing),
                        Text(
                          I18n.of(context).chatSettings_modelLabel,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Gap.vertical(height: Dimens.minSpacing),
                        Wrap(
                          spacing: Dimens.halfSpacing,
                          children: [
                            ...AIConstants.models.map(
                              (e) => ChoiceChip(
                                label: Text(e),
                                selected: e == (state.conversation?.model ?? AIConstants.defaultModel),
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
                        const Gap.vertical(height: Dimens.doubleSpacing),
                        if (state.conversation?.id != null)
                          ListTile(
                            leading: Icon(
                              IconsaxPlusBroken.trash,
                              color: context.colorScheme.error,
                            ),
                            title: Text(I18n.of(context).chatSettings_deleteConversationTitle),
                            subtitle: Text(I18n.of(context).chatSettings_deleteConversationSubtitle),
                            textColor: context.colorScheme.error,
                            onTap: () async {
                              final confirmation = await DialogBuilder.showConfirmationDialog(
                                context: context,
                                message: I18n.of(context).chatSettings_deleteConversationConfirmation,
                                isDestructiveAction: true,
                              );

                              if (confirmation == true && context.mounted) {
                                context.read<ChatCubit>().deleteConversation(conversation: state.conversation!);
                              }
                            },
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
                  onPressed: () => context.read<ChatCubit>().updateConversation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
