import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ResendVerification {
  Future<void> resendOtp(String countryCode, String phoneNumber) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    verificationCompleted(PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);

      // Get.to(const VerificationPage());
      log("number verified");
    }

    verificationFailed(FirebaseAuthException e) {
      log("code sent fail>${e.message}");
    }

    codeSent(String verificationId, int? resendToken) {
      log("Code sent ");
    }

    codeAutoRetrievalTimeout(String verificationId) {
      log("time out");
    }

    try {
      if (countryCode.isNotEmpty && phoneNumber.isNotEmpty) {
        await auth.verifyPhoneNumber(
          phoneNumber: '${countryCode}'
              '${phoneNumber}',
          timeout: const Duration(seconds: 30),
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
          forceResendingToken: null,
        );
        Get.snackbar('Resend OTP Success', '');
      } else {
        Get.snackbar('', 'Invalid phone number or country code');
      }
    } catch (e) {
      Get.snackbar('', 'Failed to resend OTP');
    }
  }
}
