import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/forms/input.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

const double _loadingIndicatorSize = 20.0;

class SendMessageForm extends StatefulWidget {
  const SendMessageForm({
    super.key,
    required this.controller,
    this.onSendMessage,
    this.isLoading = false,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onSendMessage;
  final bool isLoading;

  @override
  State<SendMessageForm> createState() => _SendMessageFormState();
}

class _SendMessageFormState extends State<SendMessageForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        children: [
          Expanded(
            child: Input(
              controller: widget.controller,
              fillColor: context.colorScheme.surface,
              filled: true,
              isBorderless: true,
              textCapitalization: TextCapitalization.sentences,
              hintText: I18n.of(context).chat_inputPlaceholder,
              textInputAction: TextInputAction.newline,
              validator: ValidationBuilder(requiredMessage: I18n.of(context).chat_messageRequiredValidation)
                  .required(I18n.of(context).chat_messageRequiredValidation)
                  .build(),
            ),
          ),
          const Gap.horizontal(width: Dimens.halfSpacing),
          widget.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(Dimens.halfSpacing),
                  child: SizedBox(
                    width: _loadingIndicatorSize,
                    height: _loadingIndicatorSize,
                    child: CircularProgressIndicator(strokeWidth: 1.2),
                  ),
                )
              : IconButton.filled(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onSendMessage?.call(widget.controller.text);
                    }
                  },
                  icon: const Icon(IconsaxPlusBroken.arrow_up, size: Dimens.iconSizeS),
                  style: IconButton.styleFrom(
                    padding: const EdgeInsets.all(12.0),
                    backgroundColor: context.colorScheme.onBackground,
                    foregroundColor: context.colorScheme.background,
                  ),
                ),
        ],
      ),
    );
  }
}
