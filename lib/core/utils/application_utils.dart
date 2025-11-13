import '../router/export.dart';

class ApplicationUtils {
  static DateTime? currentBackPressTime;

  static Future<bool> onWillPop(bool canPop) async {
    final now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      if (!canPop) showSnackBar(AppStrings.exitMsg, SnackType.success, duration: const Duration(seconds: 1));
      return false;
    } else {
      return true;
    }
  }

  static void removeKeyboard({BuildContext? context}) async {
    FocusManager.instance.primaryFocus?.unfocus();
    FocusScope.of(context ?? NavigationService.navigatorKey.currentContext!).unfocus();
  }

  static EdgeInsetsGeometry get defaultPadding => EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h);
}
