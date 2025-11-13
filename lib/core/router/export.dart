export 'dart:async';
export 'dart:convert';
export 'dart:io' hide X509Certificate;

//********************** External Packages **********************//
export 'package:cached_network_image/cached_network_image.dart';
export 'package:connectivity_plus/connectivity_plus.dart';
export 'package:device_info_plus/device_info_plus.dart';
export 'package:dio/dio.dart';
export 'package:dropdown_button2/dropdown_button2.dart';
//********************** Core Dart Packages **********************//
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
//********************** Core - Components **********************//
export 'package:flutter_base_project/core/components/app_bar/custom_app_bar.dart';
export 'package:flutter_base_project/core/components/buttons/custom_buttons.dart';
export 'package:flutter_base_project/core/components/loader.dart';
export 'package:flutter_base_project/core/components/text_field/text_field_validations.dart';
//********************** Core - Constants **********************//
export 'package:flutter_base_project/core/constants/colors/colors.dart';
export 'package:flutter_base_project/core/constants/drawable/icons.dart';
export 'package:flutter_base_project/core/constants/fonts/font_family.dart';
export 'package:flutter_base_project/core/constants/fonts/font_styles.dart';
export 'package:flutter_base_project/core/constants/strings/app_validation_strings.dart';
export 'package:flutter_base_project/core/constants/strings/country_code.dart';
export 'package:flutter_base_project/core/constants/strings/strings.dart';
// Add other components as needed

//********************** Core - Data Layer **********************//
export 'package:flutter_base_project/core/data/network/api_config.dart';
export 'package:flutter_base_project/core/data/network/api_msg_strings.dart';
export 'package:flutter_base_project/core/data/network/api_response.dart';
export 'package:flutter_base_project/core/data/network/app_exception.dart';
export 'package:flutter_base_project/core/data/network/authenticate_validator.dart';
export 'package:flutter_base_project/core/data/network/connectivity.dart';
export 'package:flutter_base_project/core/data/network/dio_util.dart';
export 'package:flutter_base_project/core/data/shared_preferences/preferences.dart';
export 'package:flutter_base_project/core/data/shared_preferences/shared_preferences_helper.dart';
//********************** Core - Router & Services **********************//
export 'package:flutter_base_project/core/router/custom_router.dart';
export 'package:flutter_base_project/core/services/navigation_services.dart';
//********************** Core - Utils **********************//
export 'package:flutter_base_project/core/utils/application_utils.dart';
export 'package:flutter_base_project/core/utils/debouncer_utils.dart';
export 'package:flutter_base_project/core/utils/debug/debug_utils.dart';
export 'package:flutter_base_project/core/utils/debug/print_log.dart';
export 'package:flutter_base_project/core/utils/dialog/dialog_box.dart';
export 'package:flutter_base_project/core/utils/gradient_background_wrapper.dart';
export 'package:flutter_base_project/core/utils/loading_widget.dart';
export 'package:flutter_base_project/core/utils/mixin/dialog_mixin.dart';
export 'package:flutter_base_project/core/utils/snack_bar.dart';
export 'package:flutter_base_project/core/utils/text_widget.dart';
//********************** Features - Auth **********************//
export 'package:flutter_base_project/features/auth/bloc/auth_bloc.dart';
export 'package:flutter_base_project/features/auth/view/forgot_password_screen.dart';
export 'package:flutter_base_project/features/auth/view/login_screen.dart';
export 'package:flutter_base_project/features/auth/view/splash_screen.dart';
// Add auth repo when created
// export 'package:flutter_base_project/features/auth/repo/auth_repo.dart';

//********************** Features - Home **********************//
export 'package:flutter_base_project/features/home/view/home_screen.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_image_compress/flutter_image_compress.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:image_picker/image_picker.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:intl_phone_field/intl_phone_field.dart';
export 'package:loading_overlay/loading_overlay.dart';
export 'package:mime/mime.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:path_provider/path_provider.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:url_launcher/url_launcher.dart';
export 'package:webview_flutter/webview_flutter.dart' hide ProgressCallback;
// Add home bloc, repo, models as needed
// export 'package:flutter_base_project/features/home/bloc/home_bloc.dart';

//********************** Features - Profile **********************//
// Add profile components as needed
// export 'package:flutter_base_project/features/profile/view/profile_screen.dart';
// export 'package:flutter_base_project/features/profile/bloc/profile_bloc.dart';
