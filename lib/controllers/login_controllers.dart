import 'dart:developer';

import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

class MyFormController extends GetxController {
  var phonenumber = ''.obs;
  var countrycode = ''.obs;

  String? validatePhoneNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Enter a valid Phone Number';
    }
    return null;
  }

  String? validateCountryCode(String value) {
    if (value.length != 2) {
      return 'Enter a valid Country Code';
    }
    return null;
  }

  void submit() {
    if (validatePhoneNumber(phonenumber.value) == null &&
        validateCountryCode(countrycode.value) == null) {
      log('Form is valid');
    } else {
      log('Form is not valid');
    }
  }

  void clearPhoneNumber() {
    phonenumber.value = '';
    update();
  }
}
