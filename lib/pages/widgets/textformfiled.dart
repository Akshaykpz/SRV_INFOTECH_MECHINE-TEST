import 'package:flutter/material.dart';

class TextformField extends StatelessWidget {
  final String text;
  final void Function(String) onchnaged;
  const TextformField({
    super.key,
    required this.onchnaged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: onchnaged,
        decoration: InputDecoration(hintText: text),
      ),
    );
  }
}
