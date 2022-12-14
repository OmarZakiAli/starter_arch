import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:starter_arch/core/common/dependencies.dart';
import 'package:starter_arch/core/common/routes.dart';
import 'package:starter_arch/core/utils/local_storage_utils.dart';
import 'package:starter_arch/features/home/pages/home.page.dart';
import 'package:starter_arch/theme/app_colors.dart';
import 'package:starter_arch/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await AppDependencies.init();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en'),
    child: const OverlaySupport.global(
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: LocalStorageUtils.listenToTheme(),
        builder: (context, _, _2) {
          return MaterialApp.router(
            theme: AppThemes.light,
            darkTheme: AppThemes.dark,
            debugShowCheckedModeBanner: false,
            themeMode: LocalStorageUtils.isDarkMode()
                ? ThemeMode.dark
                : ThemeMode.light,
            routeInformationProvider: Routes.router.routeInformationProvider,
            routeInformationParser: Routes.router.routeInformationParser,
            routerDelegate: Routes.router.routerDelegate,
            title: "App Arch",
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // child: VRouter(routes: Routes.vroutes),
          );
        });
  }
}
