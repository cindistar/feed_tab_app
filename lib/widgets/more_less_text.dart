import 'package:flutter/material.dart';

class MoreLessText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const MoreLessText({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 40,
      padding: const EdgeInsets.only(bottom: 4),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
