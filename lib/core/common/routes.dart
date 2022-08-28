import 'package:flutter/cupertino.dart';
import 'package:starter_arch/features/auth/pages/login.page.dart';
import 'package:starter_arch/features/auth/pages/splash.page.dart';
import 'package:starter_arch/features/home/pages/home.page.dart';
import 'package:vrouter/vrouter.dart';

class Routes {
  static const String splash = "/";
  static const String home = "/home";
  static const String login = "/login";

  static List<VWidget> vroutes = [
    VWidget(
      path: splash,
      widget: const SplashPage(),
      name: splash,
    ),
    VWidget(
      path: home,
      widget: const HomePage(),
      name: home,
    ),
    VWidget(path: login, widget: const LoginPage(), name: login),
  ];

  static prints() {
    vroutes.forEach((element) {
      print(element.path);
      print(element.name);
    });
  }
}
