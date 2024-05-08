import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:lineai/src/shared/utils/notifications_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: message.role == 'assistant' ? context.colorScheme.surface : context.colorScheme.background,
      child: Padding(
        padding: const EdgeInsets.all(Dimens.spacing),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: switch (message.role) {
                'user' => context.colorScheme.surface,
                _ => context.colorScheme.background
              },
              foregroundColor: switch (message.role) {
                'user' => context.colorScheme.onSurface,
                _ => context.colorScheme.onBackground
              },
              radius: 14.0,
              child: Icon(
                switch (message.role) {
                  'user' => IconsaxPlusBroken.user,
                  _ => IconsaxPlusBroken.emoji_happy,
                },
                size: 12.0,
              ),
            ),
            const Gap.horizontal(width: Dimens.spacing),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    switch (message.role) {
                      'assistant' => I18n.of(context).chat_aiAssistant,
                      'user' => Supabase.instance.client.auth.currentUser!.email!,
                      _ => ''
                    },
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: context.colorScheme.secondary, fontWeight: FontWeight.bold),
                  ),
                  const Gap.vertical(height: Dimens.minSpacing),
                  Text(message.content, style: context.textTheme.bodySmall),
                ],
              ),
            ),
            // TODO: This button will be turned into a popup menu in the future
            IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: message.content));
                $notificationService.showSuccessNotification(
                  context: context,
                  body: I18n.of(context).chat_copiedToClipboardMessage,
                );
              },
              icon: const Icon(
                IconsaxPlusBroken.copy,
                size: Dimens.iconSizeS,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
