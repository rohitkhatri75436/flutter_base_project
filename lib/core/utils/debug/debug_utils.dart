import 'dart:developer';


import '../../router/export.dart';

class DebugUtils {
  DebugUtils.showPrint(String value, {String? prefix}) {
    if (kDebugMode) {
      print("${prefix ?? "Debug_Print"} >> $value");
    }
  }

  DebugUtils.showLog(dynamic value, {String? prefix, error}) {
    if (kDebugMode) {
      log("${prefix ?? "Debug_Print"} >> $value", error: error);
    }
  }
}
