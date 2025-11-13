import '../../router/export.dart';

class DioUtil {
  factory DioUtil() {
    return _instance;
  }

  DioUtil._internal() {
    final options = BaseOptions(
      baseUrl: ApiConfig.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 45),
      headers: {},
      contentType: 'application/json',
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>?> getAuthorizationHeader() async {
    SharedPreferenceHelper pref = SharedPreferenceHelper.getInstance();
    String token = await pref.getUserAuthToken ?? '';
    //  String authToken = await pref.getUserAuthToken ?? '';
    final headers = <String, dynamic>{};
    // headers['UtcOffsetInSecond'] = '19800';
    // headers['AppVersion'] = 1;
    // headers['AccessToken'] = token.isNotEmpty ? token : 1;
    if (token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  late Dio dio;
  static final DioUtil _instance = DioUtil._internal();

  dynamic _returnResponse(Response<dynamic> response) async {
    PrintLog.printLog('Status code ---- ${response.statusCode}');
    switch (response.statusCode) {
      case 200:
        Response<dynamic> responseJson = response;
        PrintLog.printLog('Api responseJson ---- $responseJson');
        return responseJson;
      case 400:
        Response<dynamic> responseJson = response;
        PrintLog.printLog('Api responseJson ---- $responseJson');
        return responseJson;
      case 401:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        return response;
      case 403:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        await AuthenticateValidator.showPopUp(msg: response.data?['message'] ?? response.statusMessage ?? '');
      case 302:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        await AuthenticateValidator.showPopUp(msg: 'You have been logged in on another device.');
      case 422:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        return response;
      case 404:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        return response;
      case 500:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        break;
      case 503:
        showSnackBar(response.statusMessage ?? '', SnackType.failed);
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        break;
      case 409:
        Response<dynamic> responseJson = response;
        PrintLog.printLog('Api responseJson ---- $responseJson');
        return responseJson;
      default:
        PrintLog.printLog(
            'Handle Response => \n error.code -> ${response.statusCode}, \n  error.message -> ${response.statusMessage}');
        showSnackBar(response.statusMessage ?? '', SnackType.failed);
    }
  }

  // Post api
  Future<Response<dynamic>?> postApi(
      {required String path, required Map<String, dynamic> data, bool? isManageStatusCode = true}) async {
    final headers = await getAuthorizationHeader();
    PrintLog.printLog('Api Url ---- ${ApiConfig.baseUrl}$path\nApi Headers ---- $headers\nRequest body: $data');
    if (await ConnectionValidator().check()) {
      PrintLog.printLog('data ---- ${jsonEncode(data)}');
      try {
        final response = await dio.post(
          path,
          data: data.isNotEmpty ? jsonEncode(data) : null,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) => true,
          ),
        );
        if (isManageStatusCode != true) {
          PrintLog.printLog('Api responseJson ---- $response');
        }
        return isManageStatusCode == true ? await _returnResponse(response) : response;
      } on SocketException {
        showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
        return null;
      } catch (e) {
        PrintLog.printLog("Exception postApi:$e");
      }
    } else {
      showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
    }
    return null;
  }

  // Get api
  Future<Response<dynamic>?> getApi(
      {required String path, Map<String, dynamic>? queryParameters, bool? isManageStatusCode = true}) async {
    // await userNotAuthenticatePopUp();
    final headers = await getAuthorizationHeader();
    PrintLog.printLog(
        'Api Url ---- ${ApiConfig.baseUrl}$path\nApi Headers ---- $headers\nRequest body: $queryParameters');
    if (await ConnectionValidator().check()) {
      try {
        final response = await dio.get(
          path,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) => true,
          ),
          queryParameters: queryParameters != null && queryParameters.isNotEmpty ? queryParameters : {},
        );
        if (isManageStatusCode != true) {
          PrintLog.printLog('Api responseJson ---- $response');
        }
        return isManageStatusCode == true ? await _returnResponse(response) : response;
      } on SocketException {
        showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
        return null;
      } catch (e) {
        PrintLog.printLog("Exception getApi:$e");
      }
    } else {
      showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
    }
    return null;
  }

  Future<Response<dynamic>?> putApi(
      {required String path,
      FormData? formData,
      Map<String, dynamic>? queryParameters,
      bool? isManageStatusCode = true}) async {
    final headers = await getAuthorizationHeader();
    PrintLog.printLog(
        'Api Url ---- ${ApiConfig.baseUrl}$path\nApi Headers ---- $headers\nRequest body: $queryParameters'
        '${formData != null ? 'Request formData fields: ${formData.fields}\nRequest formData files: ${formData.files}' : ''}');
    if (await ConnectionValidator().check()) {
      try {
        final response = await dio.put(
          path,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) => true,
          ),
          data: formData ?? (queryParameters != null && queryParameters.isNotEmpty ? queryParameters : {}),
        );
        if (isManageStatusCode != true) {
          PrintLog.printLog('Api responseJson ---- $response');
        }
        return isManageStatusCode == true ? await _returnResponse(response) : response;
      } on SocketException {
        showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
        return null;
      } catch (e) {
        PrintLog.printLog("Exception putApi:$e");
      }
    } else {
      showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
    }
    return null;
  }

  Future<Response<dynamic>?> deleteApi(
      {required String path, Map<String, dynamic>? queryParameters, bool? isManageStatusCode = true}) async {
    final headers = await getAuthorizationHeader();
    PrintLog.printLog(
        'Api Url ---- ${ApiConfig.baseUrl}$path\nApi Headers ---- $headers\nRequest body: $queryParameters');
    if (await ConnectionValidator().check()) {
      try {
        final response = await dio.request(
          path,
          options:
              Options(method: 'DELETE', headers: headers, followRedirects: false, validateStatus: (status) => true),
          queryParameters: queryParameters != null && queryParameters.isNotEmpty ? queryParameters : {},
        );
        if (isManageStatusCode != true) {
          PrintLog.printLog('Api responseJson ---- $response');
        }
        return isManageStatusCode == true ? await _returnResponse(response) : response;
      } on SocketException {
        showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
        return null;
      } catch (e) {
        PrintLog.printLog("Exception deleteApi:$e");
      }
    } else {
      showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
    }
    return null;
  }

  Future<Response<dynamic>?> multiPartApi(
      {required String path, FormData? formData, bool? isManageStatusCode = true}) async {
    final headers = await getAuthorizationHeader();
    PrintLog.printLog(
        'Api Url ---- ${ApiConfig.baseUrl}$path\nApi Headers ---- $headers\nRequest formData fields: ${formData?.fields}\nRequest formData files: ${formData?.files}');
    if (await ConnectionValidator().check()) {
      try {
        final response = await dio.post(
          path,
          options: Options(
            headers: headers,
            followRedirects: false,
            validateStatus: (status) => true,
          ),
          data: formData ?? {},
        );
        if (isManageStatusCode != true) {
          PrintLog.printLog('Api responseJson ---- $response');
        }
        return isManageStatusCode == true ? await _returnResponse(response) : response;
      } on SocketException {
        showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
        return null;
      } catch (e) {
        PrintLog.printLog("Exception putApi:$e");
      }
    } else {
      showSnackBar(ApiMsgStrings.txtNoInternetConnection, SnackType.failed);
    }
    return null;
  }
}
