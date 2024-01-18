import 'package:get/get.dart';

class VerificationController extends GetxController {
  String hidePhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 4) {
      return '';
    }

    int numberOfDigitsToShow = 2;
    int numberOfDigitsToHide = phoneNumber.length - 4;

    String visiblePart = phoneNumber.substring(0, numberOfDigitsToShow);
    String hiddenPart = '*' * numberOfDigitsToHide;
    String lastTwoDigits = phoneNumber.substring(phoneNumber.length - 2);

    String formattedPhoneNumber = '$visiblePart$hiddenPart$lastTwoDigits';

    return formattedPhoneNumber;
  }
}
