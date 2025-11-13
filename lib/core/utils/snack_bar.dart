import '../router/export.dart';

enum SnackType { success, failed }

void showSnackBar(String data, SnackType type, {BuildContext? context, Duration? duration}) {
  ScaffoldMessenger.of(context ?? NavigationService.navigatorKey.currentContext!).hideCurrentSnackBar();
  ScaffoldMessenger.of(context ?? NavigationService.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: type == SnackType.success ? AppColors.success : AppColors.error,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      content: Text(
        data,
      ),
      duration: duration ?? const Duration(seconds: 6),
    ),
  );
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    // gravity: ToastGravity.CENTER
  );
}

void showSuccessSnackBar(String data, {BuildContext? context, Duration? duration}) {}
