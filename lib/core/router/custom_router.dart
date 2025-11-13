import 'export.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Routes
      case SplashScreen.id:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case LoginScreen.id:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case ForgotPasswordScreen.id:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      // Home Routes
      case HomeScreen.id:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      // Add more routes as you build features
      // case ProfileScreen.id:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'Route not found: ${settings.name}',
                style: FontStyles.body1,
              ),
            ),
          ),
        );
    }
  }
}
