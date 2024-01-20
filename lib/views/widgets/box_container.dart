// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ContainerView extends StatefulWidget {
  bool isVerifying = false;

  ContainerView({Key? key, required this.isVerifying}) : super(key: key);

  @override
  State<ContainerView> createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  bool isVerifying = false;
  @override
  Widget build(BuildContext context) {
    double containerSize = MediaQuery.of(context).size.width * 0.1;
    double iconSize = containerSize * 0.32;

    return isVerifying
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: iconSize,
          );
  }
}
