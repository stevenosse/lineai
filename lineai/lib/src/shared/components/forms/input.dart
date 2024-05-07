import 'package:flutter/material.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:lineai/src/shared/components/gap.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

class Input extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? cursorColor;
  final bool? filled;
  final bool isPassword;
  final int? minLines;
  final bool isBorderless;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;
  final int maxLines;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final String? labelText;

  const Input({
    super.key,
    this.focusNode,
    required this.controller,
    this.hintText,
    this.hintStyle,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.cursorColor,
    this.filled,
    this.isPassword = false,
    this.minLines,
    this.isBorderless = false,
    this.keyboardType,
    this.fillColor,
    this.validator,
    this.onChanged,
    this.readOnly = false,
    this.enabled = true,
    this.maxLines = 1,
    this.textInputAction,
    this.autofillHints,
    this.onSubmitted,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = context.colorScheme.outline;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
          ),
          const Gap.vertical(height: Dimens.minSpacing),
        ],
        SizedBox(
          height: minLines != null ? null : kMinInteractiveDimension,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.borderRadius),
            child: TextFormField(
              autofillHints: autofillHints,
              controller: controller,
              obscureText: isPassword,
              cursorColor: cursorColor,
              readOnly: readOnly,
              focusNode: focusNode,
              style: style ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              minLines: isPassword ? 1 : minLines,
              maxLines: isPassword ? 1 : maxLines,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              onFieldSubmitted: onSubmitted,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: Dimens.halfSpacing, horizontal: Dimens.spacing),
                hintText: hintText,
                hintStyle: hintStyle,
                filled: filled,
                fillColor: fillColor ?? context.colorScheme.surface,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                enabled: enabled,
                enabledBorder: isBorderless
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.borderRadius),
                        borderSide: BorderSide(color: borderColor, width: 1.0),
                      ),
                border: isBorderless
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.borderRadius),
                        borderSide: BorderSide.none,
                      ),
                focusedBorder: isBorderless
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.borderRadius),
                        borderSide: BorderSide(
                          color: borderColor,
                          width: 1.0,
                        ),
                      ),
              ),
              onChanged: onChanged,
              validator: validator,
            ),
          ),
        ),
      ],
    );
  }
}
