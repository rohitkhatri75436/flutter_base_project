import '../../router/export.dart';

class DialogBoxCustom {
  static void showSimpleDialogBox({
    required BuildContext context,
    Widget? child,
    required Function(dynamic) onValue,
    Widget? titleWidget,
    String? title,
    Widget? subTitleWidget,
    String? subTitle,
    String? actionBtnTitle,
    String? cancelBtnTitle,
    bool? isHideCancelBtn,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext buildContext) => AlertDialog.adaptive(
        title: titleWidget ?? (title != null && title.isNotEmpty ? Text(title) : const SizedBox.shrink()),
        content: subTitleWidget ?? (subTitle != null && subTitle.isNotEmpty ? Text(subTitle) : const SizedBox.shrink()),
        actions: <Widget>[
          if (isHideCancelBtn != true)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(cancelBtnTitle ?? 'No'),
            ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(actionBtnTitle ?? 'Okay'),
          ),
        ],
      ),
    ).then(onValue);
  }

  static Future<void> showNotifyDialogBox(
      {required BuildContext context,
      Widget? child,
      required Function(dynamic) onValue,
      Widget? titleWidget,
      String? title,
      Widget? subTitleWidget,
      String? subTitle,
      String? actionBtnTitle,
      bool barrierDismissible = true}) async {
    return await showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext buildContext) => AlertDialog.adaptive(
        title: titleWidget ?? (title != null && title.isNotEmpty ? Text(title) : const SizedBox.shrink()),
        content: subTitleWidget ?? (subTitle != null && subTitle.isNotEmpty ? Text(subTitle) : const SizedBox.shrink()),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              actionBtnTitle ?? 'Okay',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
            ),
          ),
        ],
      ),
    ).then(onValue);
  }
}
