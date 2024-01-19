import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final VoidCallback ontaps;
  final String text;
  final Color? color;
  final String? image;
  final double? height;
  final double? width;
  const MyButton({
    Key? key,
    this.height,
    this.width,
    required this.ontaps,
    required this.text,
    this.color,
    this.image,
  }) : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          isLoading = true;
        });

        await Future.delayed(const Duration(seconds: 3));

        widget.ontaps();

        setState(() {
          isLoading = false;
        });
      },
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.image != null)
              Image.asset(
                widget.image!,
                height: 28,
              ),
            isLoading
                ? const CircularProgressIndicator(
                    color: Colors.green,
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(color: Colors.grey),
                  ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
