import 'package:flutter/material.dart';
import 'package:asia_uz/core/imports/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await GetStorage.init();
  runApp(
    // shu joyda easy localization ishga tushvotti

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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription subscription;
  String status = "Online";

  @override
  void initState() {
    super.initState();
    // appga kirganda internet ishlavotganini tekshirish uchun listener
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          setState(() {
            status = "Offline";
            debugPrint("offline");
          });
        } else {
          setState(() {
            status = "Online";
            debugPrint("online");
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // layout builder orqali appga kirganda screen razmeriga qarab mobile uchun
    // yasalgan layoutga yoki tab uchun yasalgan layout ga kiradi
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
            // agar internet ishlab turgan bolsa splash screenga kiradi
            // aks xolda internet ishlamayaptganini korsatuvchi screen
            home: status == "Offline"
                ? const TabNoConnectionPage()
                : const TabSplashScreens(),
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
          // agar internet ishlab turgan bolsa splash screenga kiradi
          // aks xolda internet ishlamayaptganini korsatuvchi screen
          home: status == "Offline"
              ? const NoConnectionPage()
              : const SplashScreens(),
        ),
      );
    });
  }
}
