import 'package:lineai/src/core/i18n/l10n.dart';
import 'package:lineai/src/core/theme/dimens.dart';
import 'package:flutter/material.dart';
import 'package:lineai/src/shared/extensions/context_extensions.dart';

class LoadingDialog {
  static bool _isVisible = false;

  static Future<void> show({required BuildContext context, List<Widget> actions = const []}) {
    if (_isVisible == false) {
      // Hide keyboard for a better experience
      FocusManager.instance.primaryFocus?.unfocus();
      _isVisible = true;

      return showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: false,
        builder: (context) {
          return PopScope(
            canPop: false,
            child: AlertDialog.adaptive(
              surfaceTintColor: Colors.transparent,
              backgroundColor: context.colorScheme.surface,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.borderRadius)),
              content: Row(
                children: [
                  const SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  const SizedBox(width: Dimens.spacing),
                  Expanded(child: Text(I18n.of(context).loadingDialog_content)),
                ],
              ),
            ),
          );
        },
      );
    }
    return Future.value();
  }

  static void hide({required BuildContext context}) {
    if (_isVisible) {
      _isVisible = false;
      Navigator.of(context).pop();
    }
  }
}
