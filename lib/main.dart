import 'core/router/export.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // Lock device orientation to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // Initialize any required services here
    // await initializeServices();

    runApp(const MyApp());
  }, (error, stackTrace) async {
    // Handle errors globally
    debugPrint('Error: $error');
    debugPrint('StackTrace: $stackTrace');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => ApplicationUtils.removeKeyboard(),
          behavior: HitTestBehavior.opaque,
          child: BlocProvider(
            create: (context) => AuthBloc(),
            child: MaterialApp(
              onGenerateRoute: CustomRouter.generateRoute,
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationService.navigatorKey,
              initialRoute: SplashScreen.id,
              title: AppStrings.appName,
              themeMode: ThemeMode.light,
              theme: ThemeData(
                fontFamily: FontFamily.defaultFont,
                colorScheme: AppColors.materialColorPrimarySwatch,
                useMaterial3: true,
                scaffoldBackgroundColor: AppColors.background,
              ),
              // Optional: Add dark theme
              // darkTheme: ThemeData(...),
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaler: const TextScaler.linear(1.0),
                  ),
                  child: child!,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
