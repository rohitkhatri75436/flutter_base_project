import '../../router/export.dart';

class AuthenticateValidator {
  static Future<void> showPopUp({String? msg}) async {
    await DialogBoxCustom.showNotifyDialogBox(
        context: NavigationService.navigatorKey.currentContext!,
        title: msg, //'Not authenticated',
        // subTitle: msg != null && msg.isNotEmpty ? msg : ApiMsgStrings.txtSessionExpired,
        onValue: (value) async {
          SharedPreferenceHelper pref = SharedPreferenceHelper.getInstance();
          await pref.logout(NavigationService.navigatorKey.currentContext!);
        });
  }

  static Future<void> showConfirmationDialog(
      {BuildContext? context,
      required String title,
      String? description,
      Color? negativeBtnColor,
      bool? showOnlyPositive,
      Color? positiveBtnColor,
      Color? backgroundColor,
      bool deleteDescription2 = false,
      required String positiveBtnTitle,
      required String negativeBtnTitle,
      Function()? onPositiveBtnClick,
      Function()? onNegativeBtnClick,
      bool canGoBack = false}) {
    // final ctx = context ?? NavigationService.navigatorKey.currentContext!;
    // if (Platform.isIOS) {
    //   showDialog(
    //     context: ctx,
    //     barrierDismissible: false,
    //     builder: (BuildContext buildContext) => CupertinoAlertDialog(
    //       title: Text(title,
    //           style: description == null
    //               ? FontStyles.body2
    //               : FontStyles.caption.copyWith(
    //                   color: AppColors.black,
    //                 ),
    //           textAlign: TextAlign.center),
    //       content: Column(
    //         children: [
    //           if (description != null) ...[
    //             SizedBox(height: 10.h),
    //             Text(
    //               description,
    //               textAlign: TextAlign.center,
    //               style: FontStyles.textStyle5.copyWith(
    //                 color: AppColors.black,
    //               ),
    //             ),
    //           ],
    //           if (deleteDescription2) ...[
    //             SizedBox(height: 10.h),
    //             RichText(
    //               maxLines: 3,
    //               textAlign: TextAlign.center,
    //               text: TextSpan(
    //                 text: AppStrings.note,
    //                 children: <TextSpan>[
    //                   TextSpan(
    //                     text: AppStrings.deleteAccountDescription,
    //                     style: FontStyles.textStyle5.copyWith(
    //                       color: AppColors.black,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ],
    //       ),
    //       actions: <Widget>[
    //         if (!(showOnlyPositive ?? false))
    //           CupertinoDialogAction(
    //             onPressed: onNegativeBtnClick ?? () => Navigator.pop(ctx),
    //             isDefaultAction: false,
    //             child: Text(negativeBtnTitle, style: TextStyle(color: negativeBtnColor ?? AppColors.black)),
    //           ),
    //         CupertinoDialogAction(
    //           onPressed: onPositiveBtnClick ?? () => Navigator.pop(ctx),
    //           isDefaultAction: true,
    //           child: Text(positiveBtnTitle, style: TextStyle(color: positiveBtnColor ?? AppColors.black)),
    //         ),
    //       ],
    //     ),
    //   );
    //   return;
    // }
    final Dialog dialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      backgroundColor: backgroundColor,
      elevation: 10,
      child: Wrap(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18.r),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      title,
                      style: description == null ? FontStyles.body2 : FontStyles.caption,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    if (description != null) ...[
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: FontStyles.label,
                      ),
                    ],
                    if (deleteDescription2) ...[
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: AppStrings.note,
                          children: <TextSpan>[
                            TextSpan(
                              text: AppStrings.deleteAccountDescription,
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!(showOnlyPositive ?? false)) ...[
                      SizedBox(
                        width: 136.w,
                        height: 50.h,
                        child: ElevatedButton(
                          onPressed:
                              onNegativeBtnClick ?? () => Navigator.pop(NavigationService.navigatorKey.currentContext!),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.white,
                            side: BorderSide(
                              color: AppColors.primary,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: Text(negativeBtnTitle,
                              textAlign: TextAlign.center,
                              style: FontStyles.subtitle1.copyWith(color: AppColors.primary)),
                        ),
                      ),
                    ],
                    SizedBox(
                      width: 136.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed:
                            onPositiveBtnClick ?? () => Navigator.pop(NavigationService.navigatorKey.currentContext!),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(positiveBtnTitle, textAlign: TextAlign.center, style: FontStyles.subtitle1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 27.h,
              ),
            ],
          )
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      barrierColor: AppColors.backgroundDialogColor,
      context: context ?? NavigationService.navigatorKey.currentContext!,
      builder: (BuildContext buildContext) => PopScope(
        canPop: canGoBack,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) {}
        },
        child: dialog,
      ),
    );
    return Future.value();
  }
}
