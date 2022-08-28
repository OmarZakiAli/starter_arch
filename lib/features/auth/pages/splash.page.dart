import 'package:flutter/material.dart';
import 'package:starter_arch/core/common/routes.dart';
import 'package:vrouter/vrouter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Routes.prints();
    Future.delayed(const Duration(seconds: 1), () {
      context.vRouter.to(Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
