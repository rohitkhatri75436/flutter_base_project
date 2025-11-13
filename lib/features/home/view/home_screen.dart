import 'package:flutter_base_project/core/router/export.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.home,
          style: FontStyles.headline6.copyWith(color: AppColors.white),
        ),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.welcomeToApp,
              style: FontStyles.headline5,
            ),
            SizedBox(height: 20.h),
            Text(
              'Start building your features here',
              style: FontStyles.body1.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
