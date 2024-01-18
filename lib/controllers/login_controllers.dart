import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

class GoogleAuth {
  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // The user canceled the sign-in process
        return null;
      }

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      log('Google Sign-In Error: $e');

      Get.snackbar('Error', 'Failed to sign in with Google:',
          snackPosition: SnackPosition.TOP);
      return null;
    }
  }
}

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
}
