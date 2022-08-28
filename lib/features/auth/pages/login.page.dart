import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:starter_arch/common_widgets/custom_button.dart';
import 'package:starter_arch/core/common/routes.dart';
import 'package:starter_arch/features/auth/blocs/login_form.bloc.dart';
import 'package:starter_arch/theme/input_decoration.dart';
import 'package:vrouter/vrouter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginFormBloc formBloc = LoginFormBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("login".tr()),
      ),
      body: FormBlocListener(
        formBloc: formBloc,
        onSuccess: (c, s) {
          toast(s.successResponse.toString());
          context.vRouter.toNamed(Routes.home);
        },
        onFailure: (c, f) {
          toast(f.failureResponse.toString());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.name,
                decoration: inputDecoration(
                    label: "name".tr(), hint: "ahmed said zezo"),
              ),
              TextFieldBlocBuilder(
                textFieldBloc: formBloc.password,
                decoration:
                    inputDecoration(label: "password".tr(), hint: "25x@54aB"),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                  title: "login".tr(),
                  onTap: () {
                    formBloc.submit();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
