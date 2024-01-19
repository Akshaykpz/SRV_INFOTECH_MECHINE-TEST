// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:mission_test_svr_infotech/colors/colors.dart';

// class ContinerView extends StatelessWidget {
//   bool isVerifying = false;
//   ContinerView({super.key, required this.isVerifying});

// ignore_for_file: must_be_immutable

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 85,
//       width: 85,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(90),
//           color: AppColors.backgroundColr),
//       child: isVerifying
//           ? const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.white,
//               ),
//             )
//           : const Icon(
//               Icons.arrow_forward,
//               color: Colors.white,
//               size: 28,
//             ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';

class ContainerView extends StatelessWidget {
  bool isVerifying = false;
  ContainerView({Key? key, required this.isVerifying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width * 0.2;
    double iconSize = containerSize * 0.32;

    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(containerSize / 2),
        color: AppColors.backgroundColr,
      ),
      child: isVerifying
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: iconSize,
            ),
    );
  }
}
