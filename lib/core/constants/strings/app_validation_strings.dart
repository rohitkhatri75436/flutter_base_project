class AppValidationMsg {
  static const String pleaseEnterOTP = 'Please enter OTP';
  static const String pleaseEnterFullOTP = 'Please enter full OTP';
  static const String pleaseUploadOneImage = 'Please upload an image';
  static const String pleaseSelectReason = 'Please select a reason';
  static const String paymentSuccessful = 'Payment successful';
  static const String paymentFailed = 'Payment failed';
  static const String paymentCancelled = 'Payment cancelled';
  static const String paymentNotCompleted = 'Payment not completed';
  static const String ratingSubmittedSuccessfully = 'Rating submitted successfully';
  static const String pleaseGiveARatingBeforeSubmitting = 'Please give a rating before submitting';
  static const String notificationSettingsChangedSuccessfully = 'Notification settings have been changed successfully';
  static const String pleaseUploadASkillCertificate = 'Please upload a skill certificate';
  static const String pleaseUploadAValidID = 'Please upload a valid ID';
  static const String areYouSureDeleteThisImage = 'Are you sure you want to delete this image?';
  static const String logOutConfirmation = 'You will be returned to the login screen';
  static const String deleteAccountConfirmation =
      'Are you sure you want to delete your account? This action cannot be undone. Please confirm you don\'t have any active subscriptions before proceeding.';
  static const String forgotPasswordMessage = 'Please enter your email address, you will receive a link to create a new password via email';
  static const String pleaseAcceptTermsAndConditions = 'Please accept terms and conditions before proceeding';
  static const String onlyImageAllowed = 'Only JPEG and PNG images are allowed';
  static const String imageLessThanTen = 'Image size should be less than 10 MB';
  static const String accountPasswordChanged = 'Account password changed successfully';
  static const String enterName = 'Please enter your name';
  static const String thisFieldCannotBeEmpty = 'This field cannot be empty';
}

// Alias for backward compatibility
class TextFieldValidationString {
  static const String thisFieldCannotBeEmpty = AppValidationMsg.thisFieldCannotBeEmpty;
  static const String pleaseEnterValidEmail = 'Please enter a valid email address';
  static const String pleaseEnterValidPhone = 'Please enter a valid phone number';
  static const String pleaseEnterValidPassword = 'Please enter a valid password';
  static const String passwordMustBeAtLeast8Characters = 'Password must be at least 8 characters';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String pleaseEnterValidName = 'Please enter a valid name';
  static const String pleaseEnterValidValue = 'Please enter a valid value';

  // Name validations
  static const String pleaseEnterFullName = 'Please enter your full name';
  static const String enterName = AppValidationMsg.enterName;
  static const String firstNameRequired = 'First name is required';
  static const String firstNameMustNotInclude = 'First name must not include special characters';
  static const String lastNameRequired = 'Last name is required';
  static const String lastNameMustNotInclude = 'Last name must not include special characters';

  // Phone validations
  static const String phoneNumberRequired = 'Phone number is required';
  static const String phoneNumberRange = 'Phone number must be valid';
  static const String phoneNumberContain = 'Phone number must contain only digits';

  // Password validations
  static const String passwordRequired = 'Password is required';
  static const String newPassRequired = 'New password is required';
  static const String currentRequired = 'Current password is required';
  static const String confirmNewPassRequired = 'Please confirm new password';
  static const String kRequiredConfirmPass = 'Please confirm your password';
  static const String passwordShouldContain = 'Password must contain at least 8 characters, including uppercase, lowercase, and numbers';
  static const String newPasswordShouldContain = 'New password must contain at least 8 characters, including uppercase, lowercase, and numbers';
  static const String txtOldPassNewPassNotSame = 'New password cannot be same as old password';
  static const String passShouldSame = 'Passwords do not match';
  static const String passShouldBeSame = 'Passwords do not match';

  // Email validations
  static const String emailRequired = 'Email is required';
  static const String validateEmail = 'Please enter a valid email address';
  static const String invalidEmailFormat = 'Please enter a valid email';
  static const String emailOrUsernameRequired = 'Email or username is required';

  // Time validations
  static const String timeShouldBeHoursFormat = 'Time should be in hours format';
  static const String startTimeValidationMsg = 'Start time is required';
  static const String validTimeFormat = 'Please enter valid time format';
}

// Alias for AppValidationStrings
typedef AppValidationStrings = TextFieldValidationString;
