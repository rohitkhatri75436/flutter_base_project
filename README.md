# Flutter Base Project Template# flutter_fitness_app

A clean, well-structured Flutter project template with BLoC architecture, providing a solid foundation for building production-ready Flutter applications.A new Flutter project.

## 📋 Table of Contents## Getting Started

- [Overview](#overview)This project is a starting point for a Flutter application.

- [Features](#features)

- [Project Structure](#project-structure)A few resources to get you started if this is your first Flutter project:

- [Getting Started](#getting-started)

- [Architecture](#architecture)- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)

- [Core Components](#core-components)- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

- [How to Use This Template](#how-to-use-this-template)

- [Customization Guide](#customization-guide)For help getting started with Flutter development, view the

- [Best Practices](#best-practices)[online documentation](https://docs.flutter.dev/), which offers tutorials,

samples, guidance on mobile development, and a full API reference.

## 🎯 Overview

This is a base Flutter project template that follows clean architecture principles and industry best practices. It's designed to be a starting point for Flutter applications, with all the essential components and patterns already set up.

## ✨ Features

- **BLoC State Management**: Pre-configured with flutter_bloc for predictable state management
- **Clean Architecture**: Organized folder structure separating concerns
- **Network Layer**: Dio-based HTTP client with interceptors and error handling
- **Local Storage**: SharedPreferences wrapper for easy data persistence
- **Navigation Service**: Centralized navigation management
- **Responsive UI**: flutter_screenutil for responsive design across devices
- **Reusable Components**: Common widgets like buttons, text fields, app bars
- **Theme Management**: Centralized colors, fonts, and text styles
- **Connectivity Check**: Built-in network connectivity monitoring
- **Error Handling**: Comprehensive exception handling and user feedback
- **Validation**: Form validation utilities and validators
- **Loading States**: Consistent loading overlays and indicators

## 📁 Project Structure

```
lib/
├── core/
│   ├── components/          # Reusable UI components
│   │   ├── app_bar/        # Custom app bar widgets
│   │   ├── buttons/        # Button variations
│   │   ├── text_field/     # Input fields with validation
│   │   └── loader.dart     # Loading indicators
│   ├── constants/          # App constants
│   │   ├── colors/        # Color definitions
│   │   ├── fonts/         # Font families and styles
│   │   ├── strings/       # String constants
│   │   └── drawable/      # Asset paths
│   ├── data/              # Data layer
│   │   ├── network/       # API client, config, interceptors
│   │   └── shared_preferences/ # Local storage
│   ├── router/            # Navigation and routing
│   ├── services/          # App services (navigation, etc.)
│   └── utils/             # Utility functions and helpers
├── features/              # Feature modules
│   ├── auth/             # Authentication module
│   │   ├── bloc/         # Auth BLoC (state, event, bloc)
│   │   ├── repo/         # Auth repository
│   │   ├── model/        # Auth data models
│   │   └── view/         # Auth screens (login, register, etc.)
│   ├── home/             # Home module skeleton
│   └── profile/          # Profile module skeleton
└── main.dart             # App entry point
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.6.1)
- Dart SDK (^3.6.1)
- Android Studio / VS Code with Flutter extensions
- iOS development environment (for Mac users)

### Installation

1. **Clone or download this template**

   ```bash
   git clone <your-repo-url>
   cd flutter_base_project
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Initial Setup

1. **Update Package Name**

   - Update in `pubspec.yaml`
   - Update in Android: `android/app/build.gradle`
   - Update in iOS: `ios/Runner.xcodeproj`

2. **Update App Name**

   - Modify `AppStrings.appName` in `lib/core/constants/strings/strings.dart`
   - Update in `android/app/src/main/AndroidManifest.xml`
   - Update in `ios/Runner/Info.plist`

3. **Configure API Base URL**

   - Update URLs in `lib/core/data/network/api_config.dart`

4. **Add Custom Fonts (Optional)**

   - Add font files to `assets/fonts/`
   - Update `pubspec.yaml`
   - Update `FontFamily` in `lib/core/constants/fonts/font_family.dart`

5. **Customize Colors and Theme**
   - Modify colors in `lib/core/constants/colors/colors.dart`
   - Adjust theme in `lib/main.dart`

## 🏗️ Architecture

This project follows **BLoC (Business Logic Component)** pattern with clean architecture principles:

### Layers

1. **Presentation Layer** (`view/`)

   - UI components and screens
   - BLoC consumers and listeners
   - User input handling

2. **Business Logic Layer** (`bloc/`)

   - State management
   - Event handling
   - Business logic processing

3. **Data Layer** (`repo/` and `model/`)
   - API calls
   - Local storage operations
   - Data models and transformations

### Data Flow

```
UI → Event → BLoC → Repository → API/Local Storage
                ↓
              State
                ↓
              UI Update
```

## 🧩 Core Components

### Network Layer

Located in `lib/core/data/network/`:

- **DioUtil**: HTTP client wrapper with interceptors
- **ApiConfig**: API endpoint configurations
- **ApiResponse**: Standardized API response handling
- **AppException**: Custom exception types
- **ConnectivityService**: Network status monitoring

Example API call:

```dart
final response = await DioUtil().get(ApiConfig.login);
```

### State Management (BLoC)

Example BLoC structure:

```dart
// Event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
}

// State
class AuthState {
  final AuthStatus status;
  final User? user;
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    // Handle login logic
  }
}
```

### Local Storage

```dart
// Save data
await SharedPreferenceHelper.getInstance().saveUserToken('token');

// Retrieve data
final token = await SharedPreferenceHelper.getInstance().getUserToken;
```

### Navigation

```dart
// Navigate to a screen
NavigationService().pushNamed(HomeScreen.id);

// Navigate with replacement
NavigationService().pushNamedReplacement(LoginScreen.id);

// Navigate back
NavigationService().pop();
```

### Reusable Widgets

#### Custom Button

```dart
PrimaryButton(
  onPressed: () {},
  text: 'Submit',
)
```

#### Custom Text Field

```dart
CustomTextField(
  controller: emailController,
  labelText: AppStrings.email,
  validator: TextFieldValidators.emailValidator,
)
```

## 📖 How to Use This Template

### Adding a New Feature Module

1. **Create folder structure:**

   ```
   features/
   └── your_feature/
       ├── bloc/
       ├── model/
       ├── repo/
       └── view/
   ```

2. **Create BLoC files:**

   - `your_feature_event.dart`
   - `your_feature_state.dart`
   - `your_feature_bloc.dart`

3. **Create Repository:**

   - `your_feature_repo.dart` for API calls

4. **Create Models:**

   - Data models for request/response

5. **Create UI:**

   - Screen widgets in `view/`

6. **Register BLoC in main.dart:**
   ```dart
   BlocProvider(create: (context) => YourFeatureBloc()),
   ```

### Adding API Endpoints

1. Open `lib/core/data/network/api_config.dart`
2. Add your endpoint:
   ```dart
   static const String yourEndpoint = 'your/endpoint';
   ```

### Adding New Strings

1. Open `lib/core/constants/strings/strings.dart`
2. Add your string constant:
   ```dart
   static const String yourString = 'Your String';
   ```

### Adding Custom Colors

1. Open `lib/core/constants/colors/colors.dart`
2. Define your color:
   ```dart
   static const Color yourColor = Color(0xFF123456);
   ```

## 🎨 Customization Guide

### Changing Theme Colors

Edit `lib/core/constants/colors/colors.dart`:

```dart
static const Color primary = Color(0xFFYOURCOLOR);
static const Color primaryDark = Color(0xFFYOURCOLOR);
static const Color accent = Color(0xFFYOURCOLOR);
```

### Adding Custom Fonts

1. Add font files to `assets/fonts/`
2. Update `pubspec.yaml`:
   ```yaml
   fonts:
     - family: YourFontFamily
       fonts:
         - asset: assets/fonts/YourFont-Regular.ttf
         - asset: assets/fonts/YourFont-Bold.ttf
           weight: 700
   ```
3. Update `FontFamily` class

### Modifying Text Styles

Edit `lib/core/constants/fonts/font_styles.dart` to adjust text styles for your design system.

## 🔧 Best Practices

### Code Organization

- Keep files small and focused on a single responsibility
- Use meaningful names for files, classes, and variables
- Group related functionality in feature modules
- Separate business logic from UI code

### State Management

- Use BLoC for complex state management
- Keep BLoCs focused on a single feature
- Emit new states instead of modifying existing ones
- Handle all loading, success, and error states

### API Integration

- Define all endpoints in `ApiConfig`
- Use repository pattern for API calls
- Handle errors gracefully with try-catch
- Show loading indicators during API calls
- Provide user feedback for errors

### UI Development

- Use responsive widgets with `flutter_screenutil`
- Extract reusable widgets to `core/components/`
- Follow consistent spacing and styling
- Use theme colors and text styles from constants
- Implement proper form validation

### Error Handling

- Use custom exceptions for different error types
- Provide meaningful error messages to users
- Log errors for debugging
- Implement retry mechanisms where appropriate

### Performance

- Dispose controllers and streams properly
- Use `const` constructors where possible
- Implement lazy loading for lists
- Optimize images and assets
- Profile and optimize render performance

## 📦 Dependencies

### Core Dependencies

- `flutter_bloc: ^9.1.0` - State management
- `dio: ^5.8.0+1` - HTTP client
- `shared_preferences: ^2.5.3` - Local storage
- `flutter_screenutil: ^5.9.3` - Responsive UI
- `connectivity_plus: ^7.0.0` - Network monitoring

### UI Dependencies

- `flutter_svg: ^2.1.0` - SVG support
- `cached_network_image: ^3.4.1` - Image caching
- `intl: ^0.20.2` - Internationalization

### Utilities

- `device_info_plus: ^12.2.0` - Device information
- `package_info_plus: ^9.0.0` - Package information

## 🤝 Contributing

When adding new features or components to this template:

1. Follow the existing code structure and patterns
2. Document new features in this README
3. Add comments for complex logic
4. Write reusable, maintainable code
5. Test thoroughly before committing

## 📝 License

This template is free to use for any project.

## 🆘 Support

For issues, questions, or suggestions:

- Check existing documentation
- Review code comments
- Create an issue in the repository

## 🚀 Next Steps

After setting up this template:

1. ✅ Configure your API base URLs
2. ✅ Implement authentication logic
3. ✅ Add your feature modules
4. ✅ Customize theme and branding
5. ✅ Add your assets (images, fonts, icons)
6. ✅ Configure platform-specific settings
7. ✅ Test on both iOS and Android
8. ✅ Set up CI/CD pipeline
9. ✅ Configure app signing
10. ✅ Prepare for production release

---

**Happy Coding! 🎉**
