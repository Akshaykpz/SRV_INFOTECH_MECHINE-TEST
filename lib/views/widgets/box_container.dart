// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mission_test_svr_infotech/colors/colors.dart';

class ContainerView extends StatelessWidget {
  bool isVerifying = false;
  ContainerView({Key? key, required this.isVerifying}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width * 0.1;
    double iconSize = containerSize * 0.32;

    return Container(
      // height: containerSize * 1.9,
      // width: containerSize * 1.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 202, 11, 11),
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
