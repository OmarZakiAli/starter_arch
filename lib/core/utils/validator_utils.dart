import 'package:easy_localization/easy_localization.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ValidatorUtils {
  static final req = MultiValidator([
    RequiredValidator(errorText: "required".tr()),
  ]);
}
