import 'dart:developer' as dev;

import 'package:http/http.dart' as http;

import '../../router/export.dart';

class ApiBaseHelper with DialogMixin {
  ApiBaseHelper._internal();

  factory ApiBaseHelper.getInstance() {
    _instance ??= ApiBaseHelper._internal();
    return _instance!;
  }

  static final String _baseUrl = ApiConfig.baseUrl;

  static ApiBaseHelper? _instance;

  // ApiHeaders:--------------------------------get/set api headers---------------------------------------
  Map<String, String> getApiHeaders(Map<String, String>? authToken) {
    final map = {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
    };
    map.addEntries(authToken!.entries);
    return map;
  }

// Get:--------------------------------get api call with query params---------------------------------------
  Future<ApiResponse?> getApiCallWithQuery(String url, Map<String, String> queryParameters) async {
    var uri = Uri.parse(_baseUrl + url);
    uri = uri.replace(queryParameters: queryParameters);
    final headers = await getHeadersValues();
    if (kDebugMode) {
      dev.log('Api Get with params, url $uri');
    }
    final response = await safeApiCall(http.get(
      uri,
      headers: headers,
    ));
    return response;
  }

// Get:-----------------------------------------------------------------------
  Future<ApiResponse?> get(String url) async {
    if (kDebugMode) {
      dev.log('Api Get, url ${_baseUrl + url}');
    }
    final headers = await getHeadersValues();
    final response = await safeApiCall(http.get(
      Uri.parse(_baseUrl + url),
      headers: headers,
    ));
    return response;
  }

// Post:-----------------------------------------------------------------------
  Future<ApiResponse?> post(String url, dynamic jsonData) async {
    if (kDebugMode) {
      print('Api Post, url ${_baseUrl + url}');
      print('Api request- ${jsonEncode(jsonData)}');
    }
    final headers = await getHeadersValues();
    if (await ConnectionValidator().check()) {
      final response = safeApiCall(http.post(
        Uri.parse(_baseUrl + url),
        headers: headers,
        body: jsonData.isNotEmpty ? jsonEncode(jsonData) : null,
      ));

      return response;
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }

  // Post:-----------------------------------------------------------------------
  Future<ApiResponse?> postForAddSubTask(String url, jsonData) async {
    if (kDebugMode) {
      print('Api Post, url $url');
      print('Api request- ${jsonEncode(jsonData)}');
    }
    final headers = await getHeadersValues();
    if (await ConnectionValidator().check()) {
      final response = safeApiCall(http.post(
        Uri.parse(_baseUrl + url),
        headers: headers,
        body: jsonData.isNotEmpty ? jsonEncode(jsonData) : null,
      ));

      return response;
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }

// Put:-----------------------------------------------------------------------
  Future<ApiResponse?> put(String url, Map<String, dynamic> jsonData) async {
    if (kDebugMode) {
      dev.log('Api Put, url $url');
    }
    if (kDebugMode) {
      dev.log('Api request- ${jsonEncode(jsonData)}');
    }
    final headers = await getHeadersValues();
    final response = safeApiCall(http.put(Uri.parse(_baseUrl + url), headers: headers, body: jsonEncode(jsonData)));
    return response;
  }

// Delete:------------------------------------------------------
  Future<ApiResponse?> delete(String url, Map<String, dynamic> jsonData) async {
    if (kDebugMode) {
      dev.log('Api delete, url $url ');
      dev.log('Api request- ${jsonEncode(jsonData)}');
    }
    final headers = await getHeadersValues();
    final response = safeApiCall(http.delete(Uri.parse(_baseUrl + url), headers: headers, body: jsonEncode(jsonData)));
    return response;
  }

// Post multipart file to server with json data:----------------------
  Future<ApiResponse?> postApiCallMultipart(String url, File file, {multiPartParameterName}) async {
    final request = http.MultipartRequest('POST', Uri.parse(_baseUrl + url));
    DebugUtils.showLog('url ${_baseUrl + url}');
    final headers = await getHeadersValues();
    request.headers.addAll(headers);
    // request.fields.addAll(jsonData);
    if (file.existsSync()) {
      request.files.add(
        http.MultipartFile(
          multiPartParameterName ?? 'file',
          http.ByteStream(Stream.castFrom(file.openRead())),
          await file.length(),
          filename: file.path.split('/').last,
        ),
      );
    }
    if (await ConnectionValidator().check()) {
      final response = safeApiCall(http.Response.fromStream(await request.send()));
      return response;
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }

  /*----------------------------Get_Headers_Values----------------------*/

  Future<Map<String, String>> getHeadersValues() async {
    final authorization = await SharedPreferenceHelper.getInstance().getUserAuthToken;
    final accessToken = await SharedPreferenceHelper.getInstance().getUserAccessToken;
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
      if ((authorization ?? '').isNotEmpty) 'Authorization': 'Bearer $authorization',
      if ((accessToken ?? '').isNotEmpty) 'AccessToken': '$accessToken',
      'UtcOffsetInSecond': DateTime.now().timeZoneOffset.inSeconds.toString(),
      'AppVersion': '1'
    };

    dev.log(headers.toString());

    // show headers
    DebugUtils.showLog(DateTime.now().timeZoneOffset.inSeconds.toString(), prefix: 'UtcOffsetInSecond > ');

    return Future.value(headers);
  }

  Future<Map<String, String>> getHeadersForMultipartForm() async {
    final authorization = await SharedPreferenceHelper.getInstance().getUserAuthToken;
    final accessToken = await SharedPreferenceHelper.getInstance().getUserAccessToken;
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'text/plain',
      'Authorization': 'Bearer $authorization',
      'AccessToken': '$accessToken',
      'UtcOffsetInSecond': DateTime.now().timeZoneOffset.inSeconds.toString(),
      'AppVersion': '1'
    };
    dev.log(headers.toString());

    // show headers
    DebugUtils.showLog(DateTime.now().timeZoneOffset.inSeconds.toString(), prefix: 'UtcOffsetInSecond > ');

    return Future.value(headers);
  }

// SafeApiCall:--------------------------------safe api call---------------------------------------
  Future<ApiResponse?> safeApiCall(Future<http.Response> apiResponse) async {
    if (await ConnectionValidator().check()) {
      try {
        final response = await apiResponse.timeout(const Duration(seconds: 60));
        final formattedResponse = _returnResponse(response);
        return ApiResponse.success(formattedResponse.$1, formattedResponse.$2);
      } on BadRequestException catch (e) {
        return ApiResponse.error(e.toString(), e.statusCode);
      } on EmailNotRegisterException catch (e) {
        return ApiResponse.error(e.toString(), e.statusCode);
      } on AccountNotVerifiedException catch (e) {
        return ApiResponse.error(e.toString(), e.statusCode);
      } on AccountDeleteOrDeactivatedException catch (e) {
        return ApiResponse.error(e.toString(), e.statusCode);
      } on UnauthorizedException catch (e) {
        DebugUtils.showLog('error ${e.statusCode}');
        showConfirmationDialog(
            context: NavigationService.navigatorKey.currentContext,
            title: e.toString(),
            positiveBtnTitle: AppStrings.ok,
            backgroundColor: AppColors.white,
            showOnlyPositive: true,
            onPositiveBtnClick: () async {
              // Navigator.pushNamedAndRemoveUntil(
              //     NavigationService.navigatorKey.currentContext!, LoginScreen.id, (route) => false);
            },
            negativeBtnTitle: '');
        return ApiResponse.error(e.toString(), e.statusCode);
      } on FetchDataException catch (e) {
        return ApiResponse.error(ApiMsgStrings.txtSomethingWentWrong, e.statusCode);
      } on TimeoutException {
        return ApiResponse.error(ApiMsgStrings.txtConnectionTimeOut);
      } on SocketException {
        return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
      } catch (e) {
        return ApiResponse.error(e.toString());
      }
    } else {
      return ApiResponse.error(ApiMsgStrings.txtNoInternetConnection);
    }
  }
}

(dynamic, int) _returnResponse(http.Response response) {
  if (kDebugMode) {
    dev.log('hereResCode> ${response.statusCode} \n response ${response.body}');
  }
  switch (response.statusCode) {
    case 200:
      final responseJson = json.decode(utf8.decode(response.bodyBytes));
      return (responseJson, response.statusCode);
    case 202:
      throw AccountDeleteOrDeactivatedException(json.decode(response.body)['message'], response.statusCode);
    case 203:
    case 417:
      throw AccountNotVerifiedException(json.decode(response.body)['message'], response.statusCode);
    case 400:
    case 404:
      throw BadRequestException(json.decode(response.body)['message'], response.statusCode);
    case 211:
      throw EmailNotRegisterException(json.decode(response.body)['message'], response.statusCode);
    case 403:
      throw UnauthorizedException(json.decode(response.body)['message'], response.statusCode);
    case 500:
    default:
      throw FetchDataException('${ApiMsgStrings.txtServerError} ${response.statusCode}', response.statusCode);
  }
}
