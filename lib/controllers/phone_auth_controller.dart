import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_test_svr_infotech/views/pages/login_page.dart';

import 'package:mission_test_svr_infotech/views/pages/otp_verification.dart';

class PhoneVerificationService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  void verificationCompleted(PhoneAuthCredential credential) async {
    await auth.signInWithCredential(credential);
    log("Verification completed");
  }

  void verificationFailed(FirebaseAuthException e) {
    log("Verification failed: ${e.message}");
  }

  void codeSent(String verificationId, int? resendToken) {
    log("Code sent: $verificationId");
    Get.snackbar(
      'OTP sent sucessfully',
      colorText: Colors.white,
      '',
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.TOP,
    );
    Get.to(
      () => OtpverificationView(
        verificationId: verificationId,
        countrycode: countryController.selectedCountryCode.toString(),
        phoneNumber: phoneController.phonenumber.toString(),
      ),
      transition: Transition.fade,
      duration: const Duration(milliseconds: 100),
    );
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    log("Code auto retrieval timeout: $verificationId");
  }

  Future<void> verifyPhone(
      {required String countryCode, required String phoneNumber}) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+$countryCode$phoneNumber',
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
