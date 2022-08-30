import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starter_arch/core/common/routes.dart';
import 'package:starter_arch/core/utils/local_storage_utils.dart';
import 'package:starter_arch/theme/app_theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (LocalStorageUtils.isLogin()) {
        context.replaceNamed(Routes.home);
      } else {
        context.replaceNamed(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appColors.background,
      child: const Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
