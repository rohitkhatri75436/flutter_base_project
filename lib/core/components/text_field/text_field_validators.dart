import 'text_field_validation_strings.dart';

class TextFieldValidators {
  // ...existing code...

  static String? validateMoneyInput(String? value) {
    if (value == null || value.isEmpty) {
      return TextFieldValidationString.enterMoney;
    }
    final moneyRegExp = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!moneyRegExp.hasMatch(value)) {
      return TextFieldValidationString.enterValidMoney;
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final age = int.tryParse(value);
    if (age == null || age < 10 || age > 120) {
      return 'Please enter a valid age (10-120)';
    }
    return null;
  }

  static String? validateWeight(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your weight';
    }
    final weight = double.tryParse(value);
    if (weight == null || weight < 20 || weight > 200) {
      return 'Please enter a valid weight (20-200 kg)';
    }
    return null;
  }

  static String? validateHeight(String? feet, String? inches) {
    final f = int.tryParse(feet ?? '');
    final i = int.tryParse(inches ?? '');
    if (f == null && i == null) {
      return 'Please enter your height';
    }
    if (f == null || f < 1 || f > 8) {
      return 'Feet must be between 1 and 8';
    }
    if (i == null || i < 0 || i > 11) {
      return 'Inches must be between 0 and 11';
    }
    if (f == 8 && i > 11) {
      return 'Maximum height allowed is 8 ft 11 in';
    }
    return null;
  }

  // ...existing code...
}
