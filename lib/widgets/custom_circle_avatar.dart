import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String photoUrl;
  final double radiusFirst;
  final double radiusSecond;
  final Color color;
  const CustomCircleAvatar({
    Key? key,
    required this.photoUrl,
    required this.radiusFirst,
    required this.radiusSecond,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: radiusFirst,
        backgroundColor: color,
        child: CircleAvatar(
          radius: radiusSecond,
          backgroundImage: NetworkImage(photoUrl),
        ),
      ),
    );
  }
}
