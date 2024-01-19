import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';
import 'package:mission_test_svr_infotech/views/pages/login_page.dart';
import 'package:mission_test_svr_infotech/views/widgets/country_code.dart';
import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';
import 'package:mission_test_svr_infotech/views/widgets/textformfiled.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(150),
        width: ScreenUtil().setWidth(280),
        margin: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(29),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(children: [
          // klbox,
          const TextView(
            text: 'Login',
            colrs: AppColors.textColor,
            size: 20,
            fontWeight: FontWeight.bold,
          ),
          // kabox,
          const TextView(
            text: 'Enter your mobile to get',
            fontWeight: FontWeight.w300,
          ),
          const TextView(
            text: 'Login OTP',
            fontWeight: FontWeight.w500,
          ),
          // kzbox,
          const CountryDropdown(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.h,
            ),
            child: TextformField(
              onChanged: (value) => phoneController.phonenumber.value = value,
              text: 'Enter Your mobile number',
              validator: (value) =>
                  phoneController.validatePhoneNumber(value ?? ''),
              keyboardType: TextInputType.number,
              inputFormatter: [
                LengthLimitingTextInputFormatter(10),
              ],
            ),
          )
        ]));
  }
}
