import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';
import 'package:mission_test_svr_infotech/constants/constants.dart';
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
        width: ScreenUtil().setWidth(250),
        margin: EdgeInsets.symmetric(horizontal: 56.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              spreadRadius: 12,
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(children: [
          kmbox,
          const TextView(
            text: 'Login',
            colrs: AppColors.textColor,
            size: 20,
            fontWeight: FontWeight.w600,
          ),
          kkbox,
          Text('Enter your mobile to get', style: textDesion),
          Text(
            'Login OTP',
            style: textDesion,
          ),
          kkbox,
          const CountryDropdown(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.h,
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
