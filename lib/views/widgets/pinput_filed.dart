import 'package:flutter/material.dart';
import 'package:mission_test_svr_infotech/views/otp_verification.dart';
import 'package:pinput/pinput.dart';

class PinputField extends StatelessWidget {
  const PinputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      controller: otpcontoller,
      onChanged: (value) {},
      defaultPinTheme: PinTheme(
          width: 45,
          height: 48,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10))),
    );
  }
}
