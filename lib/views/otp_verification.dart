import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';
import 'package:mission_test_svr_infotech/constants/constants.dart';
import 'package:mission_test_svr_infotech/controllers/verification_controller.dart';
import 'package:mission_test_svr_infotech/views/login_page.dart';

import 'package:mission_test_svr_infotech/views/registration_page.dart';
import 'package:mission_test_svr_infotech/views/widgets/button.dart';
import 'package:mission_test_svr_infotech/views/widgets/pinput_filed.dart';
import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';
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
  String selectedCountryCode = '';

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

  bool isverifed = false;
  @override
  Widget build(BuildContext context) {
    String formattedPhoneNumber =
        VerificationController().hidePhoneNumber(widget.phoneNumber);

    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColr,
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                child: Column(
                  children: [
                    const TextView(
                      text: 'Enter OTP ',
                      colrs: AppColors.newColor,
                      size: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    kabox,
                    const TextView(
                      text: 'We have sent an OTP on',
                      colrs: AppColors.newColor,
                      size: 15,
                    ),
                    Text("$selectedCountryCode $formattedPhoneNumber  ",
                        style: const TextStyle(color: Colors.white60)),
                    kmbox,
                    const PinputField(),
                    kmbox,
                    MyButton(
                      height: 50,
                      color: AppColors.textColor,
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
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextView(
                          text: "Don't receive OTP?",
                          colrs: AppColors.newColor,
                        ),
                        MyButton(
                            ontaps: () {
                              resendOtp();
                            },
                            text: 'Resend')
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
