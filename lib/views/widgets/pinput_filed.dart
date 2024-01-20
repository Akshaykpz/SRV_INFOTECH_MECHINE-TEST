import 'package:flutter/material.dart';
import 'package:mission_test_svr_infotech/views/pages/otp_verification.dart';
import 'package:pinput/pinput.dart';

class PinputField extends StatefulWidget {
  const PinputField({super.key});

  @override
  State<PinputField> createState() => _PinputFieldState();
}

class _PinputFieldState extends State<PinputField> {
  @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();

  //   // Request permission to read SMS messages
  //   SmsAutoFill().listenForCode;
  // }

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
