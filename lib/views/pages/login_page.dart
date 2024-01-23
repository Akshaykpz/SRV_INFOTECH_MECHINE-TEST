import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';

import 'package:mission_test_svr_infotech/controllers/login_controllers.dart';
import 'package:mission_test_svr_infotech/controllers/phone_auth_controller.dart';

import 'package:mission_test_svr_infotech/views/widgets/country_code.dart';
import 'package:mission_test_svr_infotech/views/widgets/divider.dart';
import 'package:mission_test_svr_infotech/views/widgets/google_auth.dart';
import 'package:mission_test_svr_infotech/views/widgets/login_card.dart';

final MyFormController phoneController = Get.put(MyFormController());
CountryController countryController = Get.find<CountryController>();

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  bool isVerifying = false;

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
                      child: Image.asset(
                        'assets/Screenshot_2024-01-23_101431-removebg-preview.png',
                        height: ScreenUtil().setHeight(45),
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
                          child: GestureDetector(
                            child: isVerifying
                                ? const Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ))
                                : const Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 27,
                                  ),
                            onTap: () async {
                              if (phoneController.phonenumber.value.length <
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
                                await Future.delayed(
                                  const Duration(seconds: 3),
                                  () => PhoneVerificationService().verifyPhone(
                                      countryCode: countryController
                                          .selectedCountryCode
                                          .toString(),
                                      phoneNumber: phoneController.phonenumber
                                          .toString()),
                                );
                                log("added");
                                setState(() {
                                  isVerifying = false;
                                });
                              }
                            },
                          ))),
                  Positioned(
                    bottom: 70.h,
                    left: 0,
                    right: 0,
                    child: const DividerView(),
                  ),
                  const GoogleAuths(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
