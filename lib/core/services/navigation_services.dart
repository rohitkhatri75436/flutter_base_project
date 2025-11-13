import '../router/export.dart';

class NavigationService {
  factory NavigationService() {
    return _singleton;
  }

  NavigationService._internal();

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static final NavigationService _singleton = NavigationService._internal();

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    bool isNewRouteSameAsCurrent = false;
    navigatorKey.currentState!.popUntil((route) {
      if (route.settings.name == routeName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    if (!isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!.push(_createRoute(routeName, arguments));
    }
  }

  Future<dynamic> pushNamedReplacement(String routeName, {Object? arguments}) async {
    bool isNewRouteSameAsCurrent = false;
    navigatorKey.currentState!.popUntil((route) {
      if (route.settings.name == routeName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    if (!isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!.pushReplacement(_createRouteForPushReplacement(routeName, arguments));
    }
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, {Object? arguments}) async {
    bool isNewRouteSameAsCurrent = false;
    navigatorKey.currentState!.popUntil((route) {
      if (route.settings.name == routeName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    if (isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
    } else if (!isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!.push(_createRouteForPushReplacement(routeName, arguments));
    }
  }

  Future<void> pop([Object? result]) async {
    navigatorKey.currentState!.pop(result);
  }

  void navigateToHome() {
    if (navigatorKey.currentState!.canPop()) {
      navigatorKey.currentState!.popUntil((route) => route.settings.name == HomeScreen.id);
    } else {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
    }
  }

  void navigateToHomeWithReplacement() {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(HomeScreen.id, (route) => false);
  }

  Route _createRoute(String routeName, Object? arguments) {
    final settings = RouteSettings(name: routeName, arguments: arguments);
    final customRoute = CustomRouter.generateRoute(settings);

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => (customRoute as MaterialPageRoute).builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  Route _createRouteForPushReplacement(String routeName, Object? arguments) {
    final settings = RouteSettings(name: routeName, arguments: arguments);
    final customRoute = CustomRouter.generateRoute(settings);

    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => (customRoute as MaterialPageRoute).builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
