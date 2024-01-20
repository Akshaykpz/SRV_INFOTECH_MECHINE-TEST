import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mission_test_svr_infotech/constants/constants.dart';

class TextformField extends StatelessWidget {
  final String text;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;

  const TextformField({
    Key? key,
    this.validator,
    this.keyboardType,
    this.inputFormatter,
    required this.onChanged,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        decoration: InputDecoration(hintText: text, hintStyle: hintDesion),
      ),
    );
  }
}
