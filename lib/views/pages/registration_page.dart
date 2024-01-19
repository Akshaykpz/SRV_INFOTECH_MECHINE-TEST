// import 'package:flutter/material.dart';
// import 'package:mission_test_svr_infotech/colors/colors.dart';
// import 'package:mission_test_svr_infotech/constants/constants.dart';

// import 'package:mission_test_svr_infotech/views/widgets/button.dart';
// import 'package:mission_test_svr_infotech/views/widgets/text_view.dart';
// import 'package:mission_test_svr_infotech/views/widgets/textformfiled.dart';

// class VerificationPage extends StatelessWidget {
//   const VerificationPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Stack(children: [
//         Positioned(
//           top: 0,
//           right: 0,
//           left: 0,

//         Positioned(
//             top: 300,
//             left: 5,
//             child: Container(
//               height: 400,
//               margin: const EdgeInsets.symmetric(horizontal: 40),
//               width: MediaQuery.of(context).size.width - 90,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(19),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         spreadRadius: 12,
//                         blurRadius: 15)
//                   ]),
// child: Column(children: [
//   kkbox,
//   const TextView(
//     colrs: AppColors.textColor,
//     fontWeight: FontWeight.w800,
//     size: 20,
//     text: 'Update your profile',
//   ),
//   klbox,
//   TextformField(onChanged: (p0) {}, text: 'Name'),
//   TextformField(onChanged: (p0) {}, text: 'Email'),
//   TextformField(onChanged: (p0) {}, text: 'Pincode'),
//   const SizedBox(
//     height: 50,
//   ),
//   MyButton(
//     width: screenWidth - 120,
//     color: const Color.fromRGBO(169, 198, 40, 1),
//     height: 50,
//     ontaps: () {},
//     text: 'Countinue',
//   )
// ]),
//             )),
//       ]),
//     );
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
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
                  top: ScreenUtil().setHeight(184),
                  left: ScreenUtil().setWidth(-1),
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.red,
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
