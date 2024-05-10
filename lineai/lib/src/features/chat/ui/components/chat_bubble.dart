import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    this.onCopy,
    this.onRegenerate,
    this.onDelete,
  });

  final Message message;
  final VoidCallback? onCopy;
  final VoidCallback? onRegenerate;
  final VoidCallback? onDelete;

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
                size: 16.0,
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
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: context.colorScheme.onSurface, fontWeight: FontWeight.bold),
                  ),
                  const Gap.vertical(height: Dimens.minSpacing),
                  MarkdownBody(
                    data: message.content,
                    styleSheet: MarkdownStyleSheet.fromTheme(context.theme),
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
              elevation: 4.0,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: onCopy,
                    child: _MenuEntry(
                      icon: IconsaxPlusBroken.copy,
                      title: I18n.of(context).chat_copyMessage,
                    ),
                  ),
                  if (message.role == 'user')
                    PopupMenuItem(
                      onTap: onRegenerate,
                      child: _MenuEntry(
                        icon: IconsaxPlusBroken.refresh,
                        title: I18n.of(context).chat_regenerate,
                      ),
                    ),
                  PopupMenuItem(
                    onTap: onDelete,
                    child: _MenuEntry(
                      icon: IconsaxPlusBroken.trash,
                      title: I18n.of(context).chat_deleteMessage,
                      color: context.colorScheme.error,
                    ),
                  )
                ];
              },
              icon: Icon(IconsaxPlusBroken.more, color: context.colorScheme.onSurface, size: Dimens.iconSizeM),
            )
          ],
        ),
      ),
    );
  }
}

class _MenuEntry extends StatelessWidget {
  const _MenuEntry({
    required this.icon,
    required this.title,
    this.color,
  });

  final IconData icon;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: color ?? context.colorScheme.onSurface,
          size: Dimens.iconSizeM,
        ),
        const Gap.horizontal(width: Dimens.spacing),
        Expanded(
          child: Text(
            title,
            style: context.textTheme.bodyMedium?.copyWith(color: color ?? context.colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}
