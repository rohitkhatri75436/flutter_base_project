

import 'dart:developer';

import '../../router/export.dart';

class PrintLog{
  static final PrintLog _singleton = PrintLog._internal();
  factory PrintLog() {
    return _singleton;
  }
  PrintLog._internal();


  static void printLog(String value){
    if (kDebugMode) {
      // print(value.toString());
      log(value.toString());
    }
  }
}