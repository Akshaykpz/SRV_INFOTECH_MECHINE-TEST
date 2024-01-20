import 'dart:developer';

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  RxBool isLoading = false.obs;

  Future<void> verifyOTP(String otpCode, String verificationId) async {
    try {
      isLoading.value = true;

      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otpCode,
      );

      await _auth.signInWithCredential(credential);

      Get.snackbar('Success', 'OTP verification successful');
      log('OTP verification successful');
    } catch (e) {
      Get.snackbar('Error', 'Failed to verify OTP');
      log('Error OTP verification: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
