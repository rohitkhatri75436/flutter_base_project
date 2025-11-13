part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  error,
}

class AuthState {
  final AuthStatus status;
  final String? message;
  final dynamic user;

  AuthState({
    this.status = AuthStatus.initial,
    this.message,
    this.user,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? message,
    dynamic user,
  }) {
    return AuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
