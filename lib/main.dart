import 'package:asia_uz/screens/view/auth/splash/splash_screens.dart';
import 'package:asia_uz/tablet/auth/tab_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('uz', 'UZ'),
        Locale('ru', 'RU'),
        Locale('en', 'EN'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('ru', 'RU'),
      saveLocale: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => BottomNavigationBarProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => OnPressProvider(),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      if (constrains.maxWidth > 600) {
        debugPrint("tab screenga kirdi");
        return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          designSize: const Size(834, 1194),
          builder: (BuildContext ctx, Widget? child) => MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: const TabSplashScreens(),
          ),
        );
      }
      debugPrint("mobile screenga kirdi");
      return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (BuildContext ctx, Widget? child) => MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const SplashScreens(),
        ),
      );
    });
  }
}
