import 'package:flutter/material.dart';

class TagUICard extends StatelessWidget {
  final String tags;
  const TagUICard({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              //spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Text(
          tags,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
