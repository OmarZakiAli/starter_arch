import 'dart:async';
import 'dart:math';

import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:starter_arch/core/utils/notification_utils.dart';
import 'package:starter_arch/core/utils/validator_utils.dart';

class LoginFormBloc extends FormBloc<String, String> {
  final name = TextFieldBloc(name: "name", validators: [ValidatorUtils.req]);
  final password =
      TextFieldBloc(name: "password", validators: [ValidatorUtils.req]);

  LoginFormBloc() {
    addFieldBlocs(fieldBlocs: [name, password]);
  }
  @override
  onSubmitting() async {
    NotificationUtils.showLoading();
    await Future.delayed(const Duration(seconds: 1));
    NotificationUtils.hideLoading();

    if (Random.secure().nextBool()) {
      emitSuccess(successResponse: "success", canSubmitAgain: true);
    } else {
      emitFailure(failureResponse: "error");
    }
  }
}
