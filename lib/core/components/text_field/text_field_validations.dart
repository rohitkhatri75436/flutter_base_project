import '../../router/export.dart';

class TxtValidation {
  static final TxtValidation _singleton = TxtValidation._internal();

  factory TxtValidation() {
    return _singleton;
  }

  TxtValidation._internal();

  static String emptyTextField(TextEditingController controller) {
    if (controller.text.toString().trim().isEmpty) {
      return AppValidationMsg.thisFieldCannotBeEmpty;
    }
    return '';
  }

  static bool passwordMatchTextField(TextEditingController controller, TextEditingController controller2) {
    if (controller.text.toString().trim() == controller2.text.toString().trim()) {
      return false;
    }
    return true;
  }

  static bool validatePasswordTextField(TextEditingController controller) {
    if (controller.text.toString().trim().isEmpty) return true;
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~]).{8,32}$');
    if (!regex.hasMatch(controller.text.toString().trim())) return true;
    return false;
  }

  static bool validateMobileTextField(TextEditingController controller) {
    if (controller.text.toString().trim().isNotEmpty && controller.text.toString().trim().length < 10) {
      return true;
    }
    return false;
  }

  static bool validateEmailTextField(TextEditingController controller) {
    if (controller.text.toString().trim().isEmpty) {
      return true;
    }
    RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!regex.hasMatch(controller.text.toString().trim())) {
      return true;
    }
    return false;
  }
}

class Validator {
  Validator._();

  static String? validTimeFormat(String? value, String? desc, {String? endTime}) {
    final timeRegExp = RegExp(r'^([0-1][0-9]|2[0-3]):([0-5][0-9])$');
    if (value != null) {
      if (value.trim().isEmpty) {
        return '$desc is required';
      } else if (!timeRegExp.hasMatch(value) && value.length > 4) {
        return TextFieldValidationString.timeShouldBeHoursFormat;
      } else if (timeRegExp.hasMatch(value) && value.length > 4) {
        if (endTime != null && endTime.isNotEmpty) {
          if (_isStartTimeGreaterThanEndTime(
              startTimeHour: int.parse(value.split(':').first),
              startTimeMinutes: int.parse(value.split(':').last),
              endTimeHour: int.parse(endTime.split(':').first),
              endTimeMinutes: int.parse(endTime.split(':').last))) {
            return null;
          } else {
            return TextFieldValidationString.startTimeValidationMsg;
          }
        }
        return null;
      } else {
        return TextFieldValidationString.validTimeFormat;
      }
    } else {
      return '$desc is required';
    }
  }

  static bool _isStartTimeGreaterThanEndTime({int? startTimeHour, int? endTimeHour, int? startTimeMinutes, int? endTimeMinutes}) {
    if ((startTimeHour ?? 0) > (endTimeHour ?? 0)) {
      return false;
    } else if ((startTimeHour ?? 0) < (endTimeHour ?? 0)) {
      return true;
    } else if ((startTimeHour ?? 0) == (endTimeHour ?? 0)) {
      return (startTimeMinutes ?? 0) < (endTimeMinutes ?? 0);
    }
    // Handle overflow to the next day
    return true;
  }

  static String? validateName(String? value) {
    if (value != null) {
      // const pattern =
      //     r'^[\x20-\x7E\xA0-\xD7FF\xE000-\xF8FF\u2000-\u206F\u2B50\u25AA\u2194\u2600-\u26FF\u2700-\u27BF]*$';
      // final regExp = RegExp(pattern);
      if (value.trim().isEmpty) {
        return TextFieldValidationString.pleaseEnterFullName;
      }
    } else {
      return TextFieldValidationString.pleaseEnterFullName;
    }
    return null;
  }

  static String? validateEditName(String? value) {
    if (value != null) {
      // const pattern =
      //     r'^[\x20-\x7E\xA0-\xD7FF\xE000-\xF8FF\u2000-\u206F\u2B50\u25AA\u2194\u2600-\u26FF\u2700-\u27BF]*$';
      // final regExp = RegExp(pattern);
      if (value.trim().isEmpty) {
        return TextFieldValidationString.enterName;
      }
    } else {
      return TextFieldValidationString.enterName;
    }
    return null;
  }

  static String? validateFirstName(String? value) {
    if (value != null) {
      const pattern = r'(^[a-zA-Z0-9 ]*$)';
      final regExp = RegExp(pattern);
      if (value.trim().isEmpty) {
        return TextFieldValidationString.firstNameRequired;
      } else if (!regExp.hasMatch(value.trim())) {
        return TextFieldValidationString.firstNameMustNotInclude;
      }
    } else {
      return TextFieldValidationString.firstNameRequired;
    }
    return null;
  }

  static String? validateLastName(String? value) {
    if (value != null) {
      const pattern = r'(^[a-zA-Z0-9 ]*$)';
      final regExp = RegExp(pattern);
      if (value.trim().isEmpty) {
        return TextFieldValidationString.lastNameRequired;
      } else if (!regExp.hasMatch(value.trim())) {
        return TextFieldValidationString.lastNameMustNotInclude;
      }
    } else {
      return TextFieldValidationString.lastNameRequired;
    }
    return null;
  }

  static String? validateSeconds(String? value, String desc) {
    if (value == null || value.isEmpty) {
      return '$desc is required';
    }
    final seconds = int.tryParse(value);
    if (seconds == null || seconds < 1 || seconds > 60) {
      return 'The $desc must be between 1 and 60 seconds';
    }
    return null;
  }

  static String? custom(String? value, String desc) {
    if (value != null) {
      const pattern = r'(^[a-zA-Z0-9 ]*$)';
      final regExp = RegExp(pattern);
      if (value.trim().isEmpty) {
        return '';
      } else if (!regExp.hasMatch(value.trim())) {
        return '$desc must not include special characters';
      }
    } else {
      return '';
    }
    return null;
  }

  static String? locationValidate(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return '';
      } else if (value.trim().length < 3) {
        return '';
      }
    } else {
      return '';
    }
    return null;
  }

  static String? validateDateOfBirth(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return '';
      }
    }
    return null;
  }

  static String? address(String? value, String? desc) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return '$desc is required';
      }
    } else {
      return '$desc is required';
    }
    return null;
  }

  static String? descriptionCheck(String? value, String? desc) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return 'Please enter $desc';
      }
    }
    return null;
  }

  static String? validateMobile(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.phoneNumberRequired;
      } else if (value.length < 7 || value.length > 15) {
        return TextFieldValidationString.phoneNumberRange;
      }
    } else {
      return TextFieldValidationString.phoneNumberRequired;
    }
    return null;
  }

  static String? validateMobileWithSpacialChar(String? value) {
    const pattern = r'[0-9 ]';
    final regExp = RegExp(pattern);
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.phoneNumberRequired;
      } else if (value.length < 7 || value.length > 15) {
        return TextFieldValidationString.phoneNumberRange;
      } else if (!regExp.hasMatch(value)) {
        return TextFieldValidationString.phoneNumberContain;
      }
    } else {
      return TextFieldValidationString.phoneNumberRequired;
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.passwordRequired;
      }
    }
    return null;
  }

  static String? newPasswordValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.newPassRequired;
      }
    }
    return null;
  }

  static String? bioValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return '';
      }
    }
    return null;
  }

  static String? passwordValidator3(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.passwordRequired;
      } else {
        if (value.length >= 6) {
          return null;
        } else {
          return TextFieldValidationString.passwordShouldContain;
        }
      }
    } else {
      return TextFieldValidationString.passwordRequired;
    }
  }

  static String? isOldPasswordValidate(String? password) {
    if (password == null || password.isEmpty) {
      return TextFieldValidationString.currentRequired;
    } else {
      return null;
    }
  }

  static String? isNewPasswordValidate(String? password, String? oldPassword) {
    const String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@=+\$%_^&*-]).{6,16}$';
    final RegExp regExp = RegExp(pattern);
    if (password == null || password.isEmpty) {
      return TextFieldValidationString.newPassRequired;
    } else if (!(regExp.hasMatch(password))) {
      return TextFieldValidationString.newPasswordShouldContain;
    } else if (password == oldPassword) {
      return TextFieldValidationString.txtOldPassNewPassNotSame;
    } else {
      return null;
    }
  }

  static String? isPasswordValidate(String? password) {
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,15}$';
    RegExp regExp = RegExp(pattern);
    if (password == null || password.isEmpty) {
      return TextFieldValidationString.passwordRequired;
    } else if (!(regExp.hasMatch(password))) {
      return TextFieldValidationString.passwordShouldContain;
    } else {
      return null;
    }
  }

  static String? isConfirmNewPasswordValidate(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return TextFieldValidationString.confirmNewPassRequired;
    } else if (!(confirmPassword.compareTo(password ?? '') == 0)) {
      return TextFieldValidationString.passShouldSame;
    } else {
      return null;
    }
  }

  static String? isConfirmPasswordValidate(String? confirmPassword, String? password) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return TextFieldValidationString.kRequiredConfirmPass;
    } else if (!(confirmPassword.compareTo(password ?? '') == 0)) {
      return TextFieldValidationString.passShouldBeSame;
    } else {
      return null;
    }
  }

  static String? passwordDoNotMatch(String value, String confirmValue) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'PassCode is Required';
    } else if (value.length != 6) {
      return 'PassCode must be 6 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'PasscodeCode must be digits';
    } else if (value != confirmValue) {
      return 'Password do not match!';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.emailRequired;
      } else if (!regExp.hasMatch(value)) {
        return TextFieldValidationString.validateEmail;
      } else {
        return null;
      }
    } else {
      return TextFieldValidationString.emailRequired;
    }
  }

  static String? validateEmailOrUsername(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return TextFieldValidationString.emailOrUsernameRequired;
      } else {
        return null;
      }
    } else {
      return TextFieldValidationString.emailOrUsernameRequired;
    }
  }

  static String? validateText(String value, String text) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '$text is Required';
    } else if (!regExp.hasMatch(value.trim())) {
      return '$text must be a-z and A-Z';
    }
    return null;
  }

  static String? validateMoneyInput(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Budget amount is required';
    }
    final cleanValue = value.trim();
    const pattern = r'^\d*\.?\d{0,2}$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(cleanValue)) {
      return 'Please enter a valid budget amount (up to 2 decimal places)';
    }
    try {
      final amount = double.parse(cleanValue);
      if (amount > 9999.99) {
        return 'Budget amount must be less than 9,999.99';
      }
      if (amount <= 0) {
        return 'Budget amount must be greater than 0';
      }
    } catch (e) {
      return 'Please enter a valid budget amount';
    }
    return null;
  }
}
