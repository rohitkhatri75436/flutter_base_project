class AppException implements Exception {
  AppException([this._message, this.statusCode]);

  final int? statusCode;
  final String? _message;

  @override
  String toString() {
    return '$_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([super.message, super.statusCode]);
}

class BadRequestException extends AppException {
  BadRequestException([super.message, super.statusCode]);
}

class EmailNotRegisterException extends AppException {
  EmailNotRegisterException([super.message, super.statusCode]);
}

class AccountNotVerifiedException extends AppException {
  AccountNotVerifiedException([super.message, super.statusCode]);
}

class AccountDeleteOrDeactivatedException extends AppException {
  AccountDeleteOrDeactivatedException([super.message, super.statusCode]);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([super.message, super.statusCode]);
}

class InvalidInputException extends AppException {
  InvalidInputException([super.message, super.statusCode]);
}

class ForbiddenException extends AppException {
  ForbiddenException([super.message, super.statusCode]);
}

class NotFoundException extends AppException {
  NotFoundException([super.message, super.statusCode]);
}

class InternalServerErrorException extends AppException {
  InternalServerErrorException([super.message, super.statusCode]);
}
