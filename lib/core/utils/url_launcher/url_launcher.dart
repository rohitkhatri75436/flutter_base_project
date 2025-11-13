import '../../router/export.dart';

class UrlLaunchUtils {

  static Future<void> launchURL({required String url}) async {
    await launchUrl(Uri.parse(url));
  }

  static Future<void> launchURLOutsideApp({required String url, bool? launchInApp}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      PrintLog.printLog("Clicked Url:$url");
      await launchUrl(Uri.parse(url),
          mode: launchInApp == true ? LaunchMode.inAppWebView : LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> launchLocalFileType({required File file, bool? launchInApp}) async {
    final String filePath = file.absolute.path;
    PrintLog.printLog("Clicked Url:$filePath");
    if (await File(filePath).exists()) {
      // import 'package:open_file/open_file.dart';
      // await OpenFile.open(filePath);
    } else {
      PrintLog.printLog("Couldn't open this file.");
    }
  }
}
