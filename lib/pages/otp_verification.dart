import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mission_test_svr_infotech/pages/login_page.dart';

import 'package:mission_test_svr_infotech/pages/verification_page.dart';
import 'package:mission_test_svr_infotech/pages/widgets/button.dart';
import 'package:pinput/pinput.dart';

TextEditingController otpcontoller = TextEditingController();

class OtpVerificationPage extends StatefulWidget {
  final String phoneNumber;
  final String? verificationId;
  final String? countrycode;
  const OtpVerificationPage(
      {super.key,
      this.verificationId,
      required this.phoneNumber,
      this.countrycode});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  String hidePhoneNumber(String phoneNumber) {
    if (phoneNumber.length < 4) {
      return ''; // Invalid phone number
    }

    int numberOfDigitsToShow = 2; // Show the first two digits
    int numberOfDigitsToHide = phoneNumber.length - 4; // Hide the middle digits

    String visiblePart = phoneNumber.substring(0, numberOfDigitsToShow);
    String hiddenPart = '*' * numberOfDigitsToHide;
    String lastTwoDigits = phoneNumber.substring(phoneNumber.length - 2);

    String formattedPhoneNumber = '$visiblePart$hiddenPart$lastTwoDigits';

    return formattedPhoneNumber;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resendOtp() async {
    verificationCompleted(PhoneAuthCredential credential) async {
      await _auth.signInWithCredential(credential);
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
      await _auth.verifyPhoneNumber(
        phoneNumber: '+$selectedCountryCode${widget.phoneNumber}',
        timeout: const Duration(seconds: 30),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        forceResendingToken: null,
      );
      Get.snackbar('Resend OTP Sucess', '');
    } catch (e) {
      Get.snackbar('', 'Failed to resend OTP');
    }
  }

  Future<void> verifyOTP(String enteredOtp, String otpVerificationId) async {
    try {
      if (enteredOtp == widget.verificationId) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: otpVerificationId,
          smsCode: enteredOtp,
        );
        await _auth.signInWithCredential(credential);
        log("OTP VERIFIED");
        Get.to(() => const VerificationPage());
      } else {
        Get.snackbar('', 'Please enter a valid OTP');
      }
    } catch (e) {
      log("Error $e");
    }
  }

  bool isverifed = false;
  @override
  Widget build(BuildContext context) {
    String formattedPhoneNumber = hidePhoneNumber(widget.phoneNumber);

    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(16, 92, 156, 1),
      body: Stack(
        children: [
          Positioned(
              top: 90,
              left: 138,
              child: SizedBox(
                child: Stack(children: [
                  Image.asset(
                    'assets/Graphicloads-100-Flat-Email-2-PhotoRoom.png',
                    height: 90,
                  ),
                  const Positioned(
                      bottom: 46,
                      left: 35,
                      child: Icon(
                        Icons.check,
                        size: 50,
                        color: Colors.white,
                      )),
                ]),
              )),
          Positioned(
              top: 180,
              left: 4,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Column(
                  children: [
                    const Text("Enter OTP ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      "We have sent an OTP on",
                      style: TextStyle(color: Colors.white60, fontSize: 15),
                    ),
                    Text("$selectedCountryCode $formattedPhoneNumber  ",
                        style: const TextStyle(color: Colors.white60)),
                    const SizedBox(
                      height: 50,
                    ),
                    Pinput(
                      length: 6,
                      controller: otpcontoller,
                      onChanged: (value) {},
                      defaultPinTheme: PinTheme(
                          width: 45,
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    MyButton(
                      height: 50,
                      color: const Color.fromRGBO(169, 198, 40, 1),
                      width: screenWidth - 100,
                      ontaps: () async {
                        // verifyOTP(otpcontoller.text, widget.verificationId!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const VerificationPage(),
                            ));
                      },
                      text: 'Login',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't receive OTP?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              resendOtp();
                            },
                            child: const Text(
                              'Resend',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(16, 92, 156, 1),
      ),
    );
  }
}
