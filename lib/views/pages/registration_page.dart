import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';
import 'package:mission_test_svr_infotech/constants/constants.dart';
import 'package:mission_test_svr_infotech/views/widgets/button.dart';
import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';
import 'package:mission_test_svr_infotech/views/widgets/textformfiled.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Container(
                  height: ScreenUtil().setHeight(200),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundColr,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/user.png',
                      height: ScreenUtil().setHeight(22),
                    ),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(134),
                  left: ScreenUtil().setWidth(4),
                  child: Container(
                    height: 400,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    width: MediaQuery.of(context).size.width - 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 12,
                              blurRadius: 15),
                        ]),
                    child: Column(children: [
                      kkbox,
                      const TextView(
                        colrs: AppColors.textColor,
                        fontWeight: FontWeight.w800,
                        size: 20,
                        text: 'Update your profile',
                      ),
                      klbox,
                      TextformField(onChanged: (p0) {}, text: 'Name'),
                      TextformField(onChanged: (p0) {}, text: 'E-mail'),
                      TextformField(onChanged: (p0) {}, text: 'Pincode'),
                      const SizedBox(
                        height: 70,
                      ),
                      MyButton(
                        fontWeight: FontWeight.w500,
                        fontsize: 20,
                        textColor: Colors.white,
                        width: ScreenUtil().setWidth(250),
                        height: ScreenUtil().setHeight(20),
                        color: const Color.fromRGBO(169, 198, 40, 1),
                        ontaps: () {},
                        text: 'Continue',
                      )
                    ]),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
