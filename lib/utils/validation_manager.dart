import 'package:get/get.dart';

extension ValidationExt on String {
  String? get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    String? result;
    if (isEmpty) {
      result = 'this_field_required'.tr;
    } else if (!(emailRegExp.hasMatch(this))) {
      result = 'valid_email'.tr ;
    }
    return result;
  }

  String? get isNotEmptyField {
    String? result;
    if (this == null || isEmpty) {
      result = 'this_field_required'.tr;
    }
    return result;
  }

  String? get isValidPassword {
    String? result;

    if (isEmpty) {
      result = 'this_field_required'.tr;
    } else if (!(this.length > 8)) {
      result = 'password_grater_than_8'.tr;
    }
    return result;
  }

  String? get isValidPhone {
    String? result;
    final phoneRegExp = RegExp(r'^\+(972|970)\d{9}$');
    if (isEmpty) {
      result = 'this_field_required'.tr;
    } else if (!(phoneRegExp.hasMatch(this))) {
      result = 'valid_phone'.tr ;
    }
    return result;
  }

  // String? get isValidNumber {
  //   String? result;
  //   final phoneRegExp = RegExp(r'^\d+$');
  //   if (isEmpty) {
  //     result = 'this_field_required'.tr;
  //   } else if (!(phoneRegExp.hasMatch(this))) {
  //     result = 'ادخل رقم صحيح';
  //   }
  //   return result;
  // }

  String? get isValidName {
    String? result;
    if (isEmpty) {
      result = 'this_field_required'.tr;
    } else if (!(this.length > 3)) {
      result = 'valid_name'.tr ;
    }
    return result;
  }

  String? get isValidOtp {
    String? result;
    if (isEmpty) {
      result = 'this_field_required'.tr;
    } else if (this.length < 4) {
      result = 'ادخل الكود كامل';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(this)) {
      result = 'just_number';
    }
    return result;
  }
}
