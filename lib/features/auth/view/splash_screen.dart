import '../../../core/router/export.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // Add any initialization logic here (API calls, checking auth status, etc.)
    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    // Check if user is logged in
    final bool isLoggedIn = await SharedPreferenceHelper.getInstance().isLoggedIn;

    if (isLoggedIn) {
      NavigationService().pushNamedReplacement(HomeScreen.id);
    } else {
      NavigationService().pushNamedReplacement(LoginScreen.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo here
            Icon(
              Icons.flutter_dash,
              size: 100.h,
              color: AppColors.white,
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.appName,
              style: FontStyles.headline1.copyWith(
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 40.h),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
