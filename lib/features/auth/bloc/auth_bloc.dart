import '../../../core/router/export.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
    on<LogoutEvent>(_onLogout);
    on<ForgotPasswordEvent>(_onForgotPassword);
    on<ResetPasswordEvent>(_onResetPassword);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // TODO: Implement login API call
      // final response = await _authRepository.login(
      //   email: event.email,
      //   password: event.password,
      // );

      // Placeholder success response
      emit(state.copyWith(
        status: AuthStatus.authenticated,
        message: AppStrings.loginSuccessful,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // TODO: Implement register API call
      // final response = await _authRepository.register(
      //   email: event.email,
      //   password: event.password,
      //   name: event.name,
      // );

      emit(state.copyWith(
        status: AuthStatus.authenticated,
        message: AppStrings.registrationSuccessful,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      // TODO: Implement logout logic
      // await _authRepository.logout();

      emit(state.copyWith(
        status: AuthStatus.unauthenticated,
        message: AppStrings.loggedOutSuccessfully,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onForgotPassword(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // TODO: Implement forgot password API call
      // await _authRepository.forgotPassword(email: event.email);

      emit(state.copyWith(
        status: AuthStatus.initial,
        message: AppStrings.passwordResetLinkSent,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        message: e.toString(),
      ));
    }
  }

  Future<void> _onResetPassword(
    ResetPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      // TODO: Implement reset password API call
      // await _authRepository.resetPassword(
      //   token: event.token,
      //   newPassword: event.newPassword,
      // );

      emit(state.copyWith(
        status: AuthStatus.initial,
        message: AppStrings.passwordResetSuccessful,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: AuthStatus.error,
        message: e.toString(),
      ));
    }
  }
}
