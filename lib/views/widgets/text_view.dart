import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  final String? text;
  final double? size;
  final Color? colrs;
  final FontWeight? fontWeight;
  const TextView(
      {super.key, this.colrs, this.fontWeight, this.size, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(color: colrs, fontSize: size, fontWeight: fontWeight),
    );
  }
}
