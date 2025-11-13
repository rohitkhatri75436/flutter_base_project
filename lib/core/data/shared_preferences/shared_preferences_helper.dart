import '../../router/export.dart';

class SharedPreferenceHelper {
  SharedPreferenceHelper._internal();

  static Future<SharedPreferences>? _sharedPreference;
  static final SharedPreferenceHelper _singleton = SharedPreferenceHelper._internal();

  static SharedPreferenceHelper getInstance() {
    _sharedPreference ??= SharedPreferences.getInstance();
    return _singleton;
  }

  // Login:---------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference!.then((preference) {
      return preference.getBool(Preferences.isLoggedIn) ?? false;
    });
  }

  Future<void> saveIsLoggedIn(bool value) async {
    return _sharedPreference!.then((preference) {
      preference.setBool(Preferences.isLoggedIn, value);
    });
  }

  // General Methods: ----------------------------------------------------------

  Future<String?> get appVersion async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.appVersion);
    });
  }

  Future<void> saveAppVersion(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.appVersion, value);
    });
  }

  Future<String?> get getUserFullName async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userFullName);
    });
  }

  Future<void> saveUserFullName(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userFullName, value);
    });
  }

  Future<int?> get getUserId async {
    return _sharedPreference!.then((preference) {
      return preference.getInt(Preferences.userId);
    });
  }

  Future<void> saveUserId(int value) async {
    return _sharedPreference!.then((preference) {
      preference.setInt(Preferences.userId, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserEmail async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userEmail);
    });
  }

  Future<void> saveUserEmail(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userEmail, value);
    });
  }

  //----------------------------------------------------------------------
  Future<int?> get getCheckVerification async {
    return _sharedPreference!.then((preference) {
      return preference.getInt(Preferences.checkVerification);
    });
  }

  Future<void> saveCheckVerification(int value) async {
    return _sharedPreference!.then((preference) {
      preference.setInt(Preferences.checkVerification, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getDeviceId async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.deviceId);
    });
  }

  Future<void> saveUserDeviceId(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.deviceId, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserProfileImage async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userProfileImage);
    });
  }

  Future<void> saveUserProfileImage(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userProfileImage, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserAuthToken async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userAuthToken);
    });
  }

  Future<void> saveUserAuthToken(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userAuthToken, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserAccessToken async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userAccessToken);
    });
  }

  Future<void> saveUserAccessToken(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userAccessToken, value);
    });
  }

  //----------------------------------------------------------------------
  Future<int?> get getUserType async {
    return _sharedPreference!.then((preference) {
      return preference.getInt(Preferences.userType);
    });
  }

  Future<void> saveUserType(int value) async {
    return _sharedPreference!.then((preference) {
      preference.setInt(Preferences.userType, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserAddress async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userAddress);
    });
  }

  Future<void> saveUserAddress(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userAddress, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserPostalCode async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.userPostalCode);
    });
  }

  Future<void> saveUserPostalCode(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.userPostalCode, value);
    });
  }

  //----------------------------------------------------------------------
  Future<String?> get getUserMobileNumber async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.mobileNumber);
    });
  }

  Future<void> saveUserMobileNumber(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.mobileNumber, value);
    });
  }

  Future<String?> get getUserCountryCode async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.countryCode);
    });
  }

  Future<void> saveUserCountryCode(String value) async {
    return _sharedPreference!.then((preference) {
      preference.setString(Preferences.countryCode, value);
    });
  }

  Future<String?> getCurrentChatId() async {
    return _sharedPreference!.then((preference) {
      return preference.getString(Preferences.chatId);
    });
  }

  //----------------------------------------------------------------------
  Future<bool> get getFirstTime async {
    return _sharedPreference!.then((preference) {
      return preference.getBool(Preferences.isFirstTime) ?? true;
    });
  }

  Future<void> saveFirstTime(bool value) async {
    return _sharedPreference!.then((preference) {
      preference.setBool(Preferences.isFirstTime, value);
    });
  }

  //Clear preference:---------------------------------------------------
  Future<bool> clearPreference() async {
    await _sharedPreference!.then((preferences) {
      preferences.clear();
    });
    SharedPreferenceHelper.getInstance().saveFirstTime(false);
    return true;
  }

  Future<void> logout(BuildContext? context) async {
    await clearPreference();
    await Navigator.pushNamedAndRemoveUntil(
      context ?? NavigationService.navigatorKey.currentContext!,
      LoginScreen.id,
      (route) => false,
    );
  }
}
