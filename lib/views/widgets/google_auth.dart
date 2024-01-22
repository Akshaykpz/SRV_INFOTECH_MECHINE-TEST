import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mission_test_svr_infotech/controllers/google_auth.dart';
import 'package:mission_test_svr_infotech/views/widgets/button.dart';

class GoogleAuths extends StatelessWidget {
  const GoogleAuths({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
        textColor: Colors.grey.shade600,
        image:
            'assets/kisspng-google-logo-5b02bbe210fa26.4684376415269058260696.png',
      ),
    );
  }
}
