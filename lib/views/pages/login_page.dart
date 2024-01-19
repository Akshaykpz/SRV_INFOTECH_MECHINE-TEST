import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:mission_test_svr_infotech/colors/colors.dart';

import 'package:mission_test_svr_infotech/controllers/google_auth.dart';
import 'package:mission_test_svr_infotech/controllers/login_controllers.dart';
import 'package:mission_test_svr_infotech/views/pages/otp_verification.dart';

import 'package:mission_test_svr_infotech/views/widgets/button.dart';
import 'package:mission_test_svr_infotech/views/widgets/country_code.dart';
import 'package:mission_test_svr_infotech/views/widgets/divider.dart';
import 'package:mission_test_svr_infotech/views/widgets/login_card.dart';

final MyFormController phoneController = Get.put(MyFormController());
CountryController countryController = Get.find<CountryController>();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVerifying = false;
  Future<void> verifyPhone() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    verificationCompleted(PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
      log("TEST_LOG============verificationCompleted=========>");
    }

    verificationFailed(FirebaseAuthException e) {
      log("TEST_LOG========failure=============>${e.message}");
    }

    codeSent(String verificationId, int? resendToken) {
      log("TEST_LOG===========Code shared==========>${verificationId}");

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => OtpverificationView(
      //             verificationId: verificationId,
      //             phoneNumber: phoneController.phonenumber.toString(),
      //           )),
      // );
    }

    codeAutoRetrievalTimeout(String verificationId) {
      log("TEST_LOG===========Time out==========>${verificationId}");
    }

    await auth.verifyPhoneNumber(
      phoneNumber:
          '${countryController.selectedCountryCode} ${phoneController.phonenumber}',
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      splitScreenMode: true,
      designSize: const Size(360, 360),
      minTextAdapt: true,
    );

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    height: ScreenUtil().setHeight(150),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColr,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/Graphicloads-100-Flat-Email-2-PhotoRoom.png',
                              height: ScreenUtil().setHeight(40),
                            ),
                          ),
                          Positioned(
                            top: ScreenUtil().setHeight(250) * 0.230,
                            left: MediaQuery.of(context).size.width * 0.444,
                            child: Image.asset(
                              'assets/PikPng.com_telegram-png_708973.png',
                              height: ScreenUtil().setHeight(14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: ScreenUtil().setHeight(94),
                      left: ScreenUtil().setWidth(-1),
                      child: const LoginCard()),
                  Positioned(
                    top: ScreenUtil().setHeight(220),
                    right: ScreenUtil().setWidth(146),
                    child: Container(
                      width: ScreenUtil().setWidth(75),
                      height: ScreenUtil().setHeight(45),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.shade50,
                      ),
                    ),
                  ),
                  Positioned(
                    top: ScreenUtil().setHeight(210),
                    right: ScreenUtil().setWidth(151),
                    child: Container(
                      width: ScreenUtil().setWidth(65),
                      height: ScreenUtil().setHeight(65),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.backgroundColr,
                      ),
                      child: InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpverificationView(
                                      // verificationId: ,
                                      phoneNumber: phoneController.phonenumber
                                          .toString(),
                                      countrycode: countryController
                                          .selectedCountryCode
                                          .toString(),
                                    )),
                          );
                          if (phoneController.phonenumber.value.length < 10) {
                            Get.snackbar(
                              'Please enter a valid phone number',
                              colorText: Colors.white,
                              '',
                              backgroundColor: Colors.red,
                              snackPosition: SnackPosition.TOP,
                            );
                          } else {
                            setState(() {
                              isVerifying = true;
                            });
                            phoneController.submit();
                            await verifyPhone();

                            log("added");
                            Future.delayed(
                              const Duration(seconds: 6),
                              () {
                                setState(() {
                                  isVerifying = false;
                                });
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 70.h,
                    left: 0,
                    right: 0,
                    child: const DividerView(),
                  ),
                  Positioned(
                    bottom: ScreenUtil().setHeight(40),
                    right: ScreenUtil().setWidth(40),
                    child: MyButton(
                      ontaps: () async {
                        UserCredential? userCredential =
                            await GoogleAuth().signInWithGoogle();

                        if (userCredential != null) {
                          log('Signed in with Google: ${userCredential.user!.displayName}');
                        }
                      },
                      width: ScreenUtil().setWidth(280),
                      height: ScreenUtil().setHeight(20),
                      text: 'Login with Google',
                      color: Colors.white,
                      image:
                          'assets/kisspng-google-logo-5b02bbe210fa26.4684376415269058260696.png',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
