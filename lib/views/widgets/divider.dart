import 'package:flutter/material.dart';

class DividerView extends StatelessWidget {
  const DividerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              color: Colors.grey.shade300,
              height: 36,
            ),
          ),
        ),
        const Text(
          "OR",
          style: TextStyle(color: Colors.grey),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Divider(
              color: Colors.grey.shade300,
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
