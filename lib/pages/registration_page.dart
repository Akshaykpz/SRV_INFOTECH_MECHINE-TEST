import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mission_test_svr_infotech/pages/widgets/button.dart';
import 'package:mission_test_svr_infotech/pages/widgets/textformfiled.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 480,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(16, 92, 156, 1),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16))),
            child: Column(children: [
              const SizedBox(
                height: 160,
              ),
              Image.asset(
                'assets/user.png',
                height: 60,
              )
            ]),
          ),
        ),
        Positioned(
            top: 300,
            left: 5,
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
                        blurRadius: 15)
                  ]),
              child: Column(children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Update your profile",
                  style: TextStyle(
                      color: Color.fromRGBO(
                        169,
                        198,
                        40,
                        1,
                      ),
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextformField(onchnaged: (p0) {}, text: 'Name'),
                TextformField(onchnaged: (p0) {}, text: 'Email'),
                TextformField(onchnaged: (p0) {}, text: 'Pincode'),
                const SizedBox(
                  height: 50,
                ),
                MyButton(
                  width: screenWidth - 120,
                  color: const Color.fromRGBO(169, 198, 40, 1),
                  height: 50,
                  ontaps: () {},
                  text: 'Countinue',
                )
              ]),
            )),
      ]),
    );
  }
}
