import 'package:flutter/material.dart';

class TextWithShadow extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const TextWithShadow({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Text(
        text,
        style: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            shadows: const [
              Shadow(
                color: Colors.black38,
                blurRadius: 2,
                offset: Offset(2, 1),
              ),
            ],
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
