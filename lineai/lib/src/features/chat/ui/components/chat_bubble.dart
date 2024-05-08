import 'package:flutter/material.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/datasource/models/message.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';
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
                        ?.copyWith(color: context.colorScheme.secondary, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
