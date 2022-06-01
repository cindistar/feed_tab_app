import 'package:flutter/material.dart';

class CaptionText extends StatelessWidget {
  final String userName;
  final String captionText;
  const CaptionText({super.key, required this.userName, required this.captionText});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.left,
      maxLines: 2,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        children: [
          TextSpan(text: userName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const TextSpan(text: ' '),
          TextSpan(
            text: captionText.length >= 70 ? captionText.substring(0, 70) : captionText,
            style: const TextStyle(fontSize: 16),
          ),
          const TextSpan(text: ' '),
        ],
      ),
    );
  }
}
