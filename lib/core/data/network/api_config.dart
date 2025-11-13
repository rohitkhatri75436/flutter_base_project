class ApiConfig {
  ApiConfig._();

  /// URLs
  static const String devUrl = 'https://fitnessapp-dev.24livehost.com/api/v1/';
  static const String uatUrl = 'https://fitnessapp-uat.24livehost.com/api/v1/';
  static const String liveUrl = 'https://fitpro360x.com/api/v1/';
  static String baseUrl = liveUrl;
  static const String basePrivacyUrl = livePrivacyUrl;

  static const String devPrivacyUrl = 'https://fitnessapp-dev.24livehost.com';
  static const String uatPrivacyUrl = 'https://fitnessapp-uat.24livehost.com';
  static const String livePrivacyUrl = 'https://fitpro360x.com';

  static const String privacyPolicyUrl = '$basePrivacyUrl/privacy-policy';
  static const String termsAndConditionsUrl = '$basePrivacyUrl/terms-condition';
  static const String aboutUsUrl = '$basePrivacyUrl/about';

  //--------------- On-Boarding --------------//
  static const String login = 'auth/login';
  static const String logOut = 'auth/logout';
  static const String forgotPassword = 'forgot-password';
  static const String changePassword = 'auth/change-password';
  static const String signUp = 'signup';
  static const String verifyOTP = 'verify-otp';
  static const String resendOTP = 'send-otp';
  static const String questionnaire = 'auth/questions';
  static const String postQuestionnaire = 'auth/questionsanswer';
  static const String supportRequest = 'auth/support-request';
  static const String updateProfile = 'auth/update-profile';

  //-------------- Profile-------------------//
  static const String deleteProfile = 'auth/delete';

  //--------------- Firebase --------------//
  static const String chatEnv = 'dev';
  static const String sendNotification = 'Notification/SendNotification';

  //--------------- User Block --------------//5
  static const String blockUser = 'UserBlock/BlockUser';
  static const String unblockUser = 'UserBlock/UnblockUser';

  //---------------Report --------------//
  static const String saveReport = 'Report/SaveReport';
  static const String getReports = 'Report/GetReports';

  //----------------FAQ-----------------//
  static const String faq = 'Faq/Faqs';

  //-----------------Dashboard-----------------//
  static const String addWorkoutProgress = 'auth/workout-exercise-progress';
  static const String addChallengeProgress = 'auth/challenge-exercise-progress';
  static const String getChallengesList = '/auth/challenge/list';
  static const String getChallengesBase = '/auth/challenge/';
  static const String getWorkoutPlanBase = 'auth/workoutPlan/';
  static const String getWorkoutWeek = 'week/';
  static const String getCurrentPlan = 'auth/workoutPlan/getCurrentPlan';
  static const String getAllWeekWorkoutPlan = 'allWeeks';
  static const String getExerciseDetail = 'getExercise/';
  static const String buyChallenge = 'auth/challengesubscription/saveChallengeSubscription';

  // -------------- Meals -----------------//
  static const String getMealTypeAndPreference = 'auth/meal/getMealByTypeAndDietPreference';
  static const String getDietPreference = 'auth/meal/getDietPreference';
  static const String getMealtypeByDietPreference = 'auth/meal/getMealTypesByDietPreference';
  static const String getMealDetail = 'auth/meal/detailMeal';
  static const String updateDietPreference = 'auth/meal/updateDietPreference';

  //--------------- Exercise -----------------//
  static const String getExerciseList = 'auth/exercise/getExercisesByBodyType';
  static const String getExerciseDetailById = 'auth/exercise/getExerciseDetails';
  static const String getExercises = 'auth/exercise/getBodyTypes';

  //--------------- Subscription -----------------//
  static const String getSubscriptionPlans = 'auth/subscription/getUserSubscriptions';
  static const String getSubscriptionDetails = 'auth/subscription/getSubscriptionDetails';
  static const String savePurchaseLog = 'auth/subscription/savePurchaseLog';
  static const String cancelSubscription = 'auth/subscription/cancelAndroidSubscription';
  static const String saveChallengeSubscription = 'auth/challengesubscription/saveChallengeSubscription';
  static const String restoreSubscription = 'auth/subscription/iosSubscriptionRestore';
  static const String restoreAndroidSubcription = 'auth/subscription/androidSubscriptionRestore';
  static const String replaceUserSubscription = 'auth/subscription/replaceUserSubscription';

  //--------------- Notification -----------------//
  static const String getNotificationList = 'auth/getallnotifications';
  static const String getNotificationFlag = 'auth/get-notification-count';
  static const String setNotificationFlag = 'auth/toggle-notifications';
  static const String deleteNotification = 'auth/deletenotifications';
  static const String deleteAllNotification = 'auth/delete-all-notifications';
}
