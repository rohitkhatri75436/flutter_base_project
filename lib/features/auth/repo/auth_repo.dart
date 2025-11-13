class AuthRepository {
  // final DioUtil _dioUtil = DioUtil();

  /// Login API Call
  ///
  /// Example implementation:
  /// ```dart
  /// Future<ApiResponse> login({
  ///   required String email,
  ///   required String password,
  /// }) async {
  ///   try {
  ///     final response = await _dioUtil.post(
  ///       ApiConfig.login,
  ///       data: {
  ///         'email': email,
  ///         'password': password,
  ///       },
  ///     );
  ///     return ApiResponse.fromJson(response);
  ///   } catch (e) {
  ///     rethrow;
  ///   }
  /// }
  /// ```

  /// Register API Call
  ///
  /// Example implementation:
  /// ```dart
  /// Future<ApiResponse> register({
  ///   required String email,
  ///   required String password,
  ///   required String name,
  /// }) async {
  ///   try {
  ///     final response = await _dioUtil.post(
  ///       ApiConfig.register,
  ///       data: {
  ///         'email': email,
  ///         'password': password,
  ///         'name': name,
  ///       },
  ///     );
  ///     return ApiResponse.fromJson(response);
  ///   } catch (e) {
  ///     rethrow;
  ///   }
  /// }
  /// ```

  /// Logout API Call
  ///
  /// Example implementation:
  /// ```dart
  /// Future<void> logout() async {
  ///   try {
  ///     await _dioUtil.post(ApiConfig.logout);
  ///     await SharedPreferenceHelper.getInstance().clearAll();
  ///   } catch (e) {
  ///     rethrow;
  ///   }
  /// }
  /// ```

  /// Forgot Password API Call
  ///
  /// Example implementation:
  /// ```dart
  /// Future<ApiResponse> forgotPassword({required String email}) async {
  ///   try {
  ///     final response = await _dioUtil.post(
  ///       ApiConfig.forgotPassword,
  ///       data: {'email': email},
  ///     );
  ///     return ApiResponse.fromJson(response);
  ///   } catch (e) {
  ///     rethrow;
  ///   }
  /// }
  /// ```

  /// Reset Password API Call
  ///
  /// Example implementation:
  /// ```dart
  /// Future<ApiResponse> resetPassword({
  ///   required String token,
  ///   required String newPassword,
  /// }) async {
  ///   try {
  ///     final response = await _dioUtil.post(
  ///       ApiConfig.resetPassword,
  ///       data: {
  ///         'token': token,
  ///         'new_password': newPassword,
  ///       },
  ///     );
  ///     return ApiResponse.fromJson(response);
  ///   } catch (e) {
  ///     rethrow;
  ///   }
  /// }
  /// ```
}
