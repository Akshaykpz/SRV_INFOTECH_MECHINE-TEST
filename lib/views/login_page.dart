// import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:mission_test_svr_infotech/colors/colors.dart';
// import 'package:mission_test_svr_infotech/constants/constants.dart';
// import 'package:mission_test_svr_infotech/controllers/google_auth.dart';

// import 'package:mission_test_svr_infotech/controllers/login_controllers.dart';
// import 'package:mission_test_svr_infotech/views/otp_verification.dart';
// import 'package:mission_test_svr_infotech/views/widgets/box_container.dart';
// import 'package:mission_test_svr_infotech/views/widgets/country_code.dart';
// import 'package:mission_test_svr_infotech/views/widgets/button.dart';
// import 'package:mission_test_svr_infotech/views/widgets/divider.dart';
// import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';
// import 'package:mission_test_svr_infotech/views/widgets/textformfiled.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final MyFormController phoneContoller = Get.put(MyFormController());
//   CountryController countryController = Get.find<CountryController>();

//   Future<void> verifyPhone() async {
//     final FirebaseAuth auth = FirebaseAuth.instance;
//     verificationCompleted(PhoneAuthCredential credential) async {
//       await auth.signInWithCredential(credential);
//       log("TEST_LOG============verificationCompleted=========>");
//     }

//     verificationFailed(FirebaseAuthException e) {
//       log("TEST_LOG========failure=============>${e.message}");
//     }

//     codeSent(String verificationId, int? resendToken) {
//       log("TEST_LOG===========Code shared==========>${verificationId}");
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (context) => OtpVerificationPage(
//                   verificationId: verificationId,
//                   phoneNumber: phoneContoller.phonenumber.toString(),
//                 )),
//       );
//     }

//     codeAutoRetrievalTimeout(String verificationId) {
//       log("TEST_LOG===========Time out==========>${verificationId}");
//     }

//     await auth.verifyPhoneNumber(
//       phoneNumber:
//           '${countryController.selectedCountryCode} ${phoneContoller.phonenumber}',
//       timeout: const Duration(seconds: 30),
//       verificationCompleted: verificationCompleted,
//       verificationFailed: verificationFailed,
//       codeSent: codeSent,
//       codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
//     );
//   }

//   bool isVerifying = false;

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.blueGrey.shade50,
//         body: Stack(children: [
//           Positioned(
//             top: 0,
//             right: 0,
//             left: 0,
//             child: Container(
//                 height: 330,
//                 decoration: const BoxDecoration(
//                     color: AppColors.backgroundColr,
//                     borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(16),
//                         bottomRight: Radius.circular(15))),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 80,
//                       left: 144,
//                       child: Image.asset(
//                         'assets/Graphicloads-100-Flat-Email-2-PhotoRoom.png',
//                         height: 80,
//                       ),
//                     ),
//                     Positioned(
//                         top: 88,
//                         left: 176,
//                         child: Image.asset(
//                           'assets/PikPng.com_telegram-png_708973.png',
//                           height: 26,
//                         ))
//                   ],
//                 )),
//           ),
//           Positioned(
//             top: 170,
//             child: SizedBox(
//               height: 600,
//               child: Stack(
//                 children: [
//                   (Container(
//                     height: 380,
//                     width: MediaQuery.of(context).size.width - 100,
//                     margin: const EdgeInsets.symmetric(horizontal: 50),
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(25),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12.withOpacity(0.1),
//                               spreadRadius: 10,
//                               blurRadius: 12)
//                         ]),
//                     child: Column(
//                       children: [
//                         kkbox,
//                         const TextView(
//                           text: 'Login',
//                           colrs: AppColors.textColor,
//                           size: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         kabox,
//                         const TextView(
//                           text: 'Enter your mobile to get',
//                           fontWeight: FontWeight.w500,
//                         ),
//                         const TextView(
//                           text: 'Login OTP',
//                           fontWeight: FontWeight.w500,
//                         ),
//                         kzbox,
//                         const CountryDropdown(),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 23),
//                           child: TextformField(
//                               onChanged: (value) =>
//                                   phoneContoller.phonenumber.value = value,
//                               text: 'Enter Your mobile number',
//                               validator: (value) => phoneContoller
//                                   .validatePhoneNumber(value ?? ''),
//                               keyboardType: TextInputType.number,
//                               inputFormatter: [
//                                 LengthLimitingTextInputFormatter(10),
//                               ]),
//                         ),
//                       ],
//                     ),
//                   )),
//                   Positioned(
//                     top: 330,
//                     left: 145,
//                     child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(90),
//                             boxShadow: [
//                               BoxShadow(
//                                 spreadRadius: 1,
//                                 color: Colors.blueGrey.shade50,
//                               )
//                             ]),
//                         height: 90,
//                         width: 90,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                                 top: 4,
//                                 left: 4,
//                                 child: InkWell(
//                                   onTap: () {
//                                     //  verifyPhone();
//                                     if (phoneContoller
//                                             .phonenumber.value.length <
//                                         10) {
//                                       Get.snackbar(
//                                           'Please enter a valid phone number',
//                                           colorText: Colors.white,
//                                           '',
//                                           backgroundColor: Colors.red,
//                                           snackPosition: SnackPosition.TOP);
//                                     } else {
//                                       setState(() {
//                                         isVerifying = true;
//                                       });
//                                       phoneContoller.submit();
//                                       verifyPhone();

//                                       log("added");
//                                       Future.delayed(
//                                         const Duration(seconds: 6),
//                                         () {
//                                           setState(() {
//                                             isVerifying = false;
//                                           });
//                                         },
//                                       );
//                                     }
//                                   },
//                                   child: ContinerView(isVerifying: isVerifying),
//                                 ))
//                           ],
//                         )),
//                   ),
//                   const Positioned(
//                       bottom: 100, left: 0, right: 0, child: DividerView()),
//                   Positioned(
//                     bottom: 37,
//                     left: 40,
//                     child: MyButton(
//                         ontaps: () async {
//                           UserCredential? userCredential =
//                               await GoogleAuth().signInWithGoogle();

//                           if (userCredential != null) {
//                             log('Signed in with Google: ${userCredential.user!.displayName}');
//                           }
//                         },
//                         height: 50,
//                         width: screenWidth - 80,
//                         text: 'Login with Google',
//                         color: Colors.white,
//                         image:
//                             'assets/kisspng-google-logo-5b02bbe210fa26.4684376415269058260696.png'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';
import 'package:mission_test_svr_infotech/constants/constants.dart';
import 'package:mission_test_svr_infotech/controllers/google_auth.dart';
import 'package:mission_test_svr_infotech/controllers/login_controllers.dart';
import 'package:mission_test_svr_infotech/views/otp_verification.dart';
import 'package:mission_test_svr_infotech/views/widgets/box_container.dart';
import 'package:mission_test_svr_infotech/views/widgets/country_code.dart';
import 'package:mission_test_svr_infotech/views/widgets/button.dart';
import 'package:mission_test_svr_infotech/views/widgets/divider.dart';
import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';
import 'package:mission_test_svr_infotech/views/widgets/textformfiled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MyFormController phoneController = Get.put(MyFormController());
  CountryController countryController = Get.find<CountryController>();
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
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OtpVerificationPage(
                  verificationId: verificationId,
                  phoneNumber: phoneController.phonenumber.toString(),
                )),
      );
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: constraints.maxHeight * 0.3,
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColr,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: constraints.maxHeight * 0.05,
                          left: constraints.maxWidth * 0.35,
                          child: Image.asset(
                            'assets/Graphicloads-100-Flat-Email-2-PhotoRoom.png',
                            height: constraints.maxHeight * 0.1,
                          ),
                        ),
                        Positioned(
                          top: constraints.maxHeight * 0.06,
                          left: constraints.maxWidth * 0.4,
                          child: Image.asset(
                            'assets/PikPng.com_telegram-png_708973.png',
                            height: constraints.maxHeight * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: constraints.maxHeight * 0.2,
                  child: SizedBox(
                    height: constraints.maxHeight * 0.8,
                    child: Stack(
                      children: [
                        Container(
                          height: constraints.maxHeight * 0.5,
                          width: constraints.maxWidth - 100,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                spreadRadius: 10,
                                blurRadius: 12,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              kkbox,
                              const TextView(
                                text: 'Login',
                                colrs: AppColors.textColor,
                                size: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              kabox,
                              const TextView(
                                text: 'Enter your mobile to get',
                                fontWeight: FontWeight.w500,
                              ),
                              const TextView(
                                text: 'Login OTP',
                                fontWeight: FontWeight.w500,
                              ),
                              kzbox,
                              const CountryDropdown(),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: constraints.maxWidth * 0.07),
                                child: TextformField(
                                  onChanged: (value) =>
                                      phoneController.phonenumber.value = value,
                                  text: 'Enter Your mobile number',
                                  validator: (value) => phoneController
                                      .validatePhoneNumber(value ?? ''),
                                  keyboardType: TextInputType.number,
                                  inputFormatter: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: constraints.maxHeight * 0.45,
                          left: constraints.maxWidth * 0.36,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 1,
                                  color: Colors.blueGrey.shade50,
                                ),
                              ],
                            ),
                            height: constraints.maxHeight * 0.16,
                            width: constraints.maxHeight * 0.12,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: constraints.maxHeight * 0.0118,
                                  left: constraints.maxHeight * 0.011,
                                  child: InkWell(
                                    onTap: () {
                                      if (phoneController
                                              .phonenumber.value.length <
                                          10) {
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
                                        verifyPhone();

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
                                    child:
                                        ContainerView(isVerifying: isVerifying),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: constraints.maxHeight * 0.15,
                          left: 0,
                          right: 0,
                          child: const DividerView(),
                        ),
                        Positioned(
                          bottom: constraints.maxHeight * 0.05,
                          left: constraints.maxWidth * 0.1,
                          child: MyButton(
                            ontaps: () async {
                              UserCredential? userCredential =
                                  await GoogleAuth().signInWithGoogle();

                              if (userCredential != null) {
                                log('Signed in with Google: ${userCredential.user!.displayName}');
                              }
                            },
                            height: constraints.maxHeight * 0.06,
                            width: constraints.maxWidth -
                                constraints.maxWidth * 0.2,
                            text: 'Login with Google',
                            color: Colors.white,
                            image:
                                'assets/kisspng-google-logo-5b02bbe210fa26.4684376415269058260696.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
