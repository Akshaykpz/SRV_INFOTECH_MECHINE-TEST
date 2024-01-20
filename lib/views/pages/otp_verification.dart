import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mission_test_svr_infotech/colors/colors.dart';
import 'package:mission_test_svr_infotech/constants/constants.dart';
import 'package:mission_test_svr_infotech/controllers/otp_controller.dart';
import 'package:mission_test_svr_infotech/controllers/verification_controller.dart';

import 'package:mission_test_svr_infotech/views/widgets/button.dart';
import 'package:mission_test_svr_infotech/views/widgets/pinput_filed.dart';
import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';

TextEditingController otpcontoller = TextEditingController();

class OtpverificationView extends StatefulWidget {
  final String? phoneNumber;
  final String? verificationId;
  final String? countrycode;
  const OtpverificationView(
      {super.key, this.phoneNumber, this.verificationId, this.countrycode});

  @override
  State<OtpverificationView> createState() => _OtpverificationViewState();
}

class _OtpverificationViewState extends State<OtpverificationView> {
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

//   bool isverifed = false;
  @override
  Widget build(BuildContext context) {
    String formattedPhoneNumber =
        VerificationController().hidePhoneNumber(widget.phoneNumber!);
    return Scaffold(
      backgroundColor: AppColors.backgroundColr,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            // color: Colors.black,
            child: Stack(
              children: [
                Positioned(
                  top: ScreenUtil().setHeight(250) * 0.565,
                  left: MediaQuery.of(context).size.width * 0.360,
                  child: Image.asset(
                    'assets/Graphicloads-100-Flat-Email-2-PhotoRoom.png',
                    height: ScreenUtil().setHeight(70),
                  ),
                ),
                Positioned(
                    top: ScreenUtil().setHeight(250) * 0.535,
                    left: MediaQuery.of(context).size.width * 0.439,
                    child: Icon(
                      Icons.check,
                      size: ScreenUtil().setHeight(41),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const TextView(
                  text: ' Enter OTP',
                  colrs: AppColors.newColor,
                  size: 20,
                ),
                klbox,
                Text(
                  'We have sent an OTP on',
                  style: newFont,
                ),
                Text("${widget.countrycode} $formattedPhoneNumber  ",
                    style: newFont),
                kabox,
                const PinputField(),
                kabox,
                MyButton(
                  textColor: Colors.white,
                  width: ScreenUtil().setWidth(280),
                  height: ScreenUtil().setHeight(40),
                  color: AppColors.textColor,
                  ontaps: () async {
                    OtpController()
                        .verifyOTP(otpcontoller.text, widget.verificationId!);
                  },
                  text: 'Login',
                ),
                kzbox,
                Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TextView(
                      text: "Don't receive OTP? ",
                      colrs: AppColors.newColor,
                    ),
                    // kkbox,
                    TextButton(
                      onPressed: () async {
                        await resendOtp();
                      },
                      child: const Text(
                        "Resend",
                        style: TextStyle(color: AppColors.newColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
