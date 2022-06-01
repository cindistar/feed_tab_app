import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  static const String mapBorderPng = 'assets/images/map_border.png';
  static const String speechBublePng = 'assets/images/speech_buble_border.png';
  static const String redHeartPng = 'assets/images/red_heart.png';
  static const String paperPlanePng = 'assets/images/paper_plane_border.png';

  final VoidCallback onPressed;
  final String assetImagePath;

  const ToolBar({super.key, required this.onPressed, required this.assetImagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 56, right: 56),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            mapBorderPng,
            width: 32,
            height: 32,
          ),
          Image.asset(
            speechBublePng,
            width: 32,
            height: 32,
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: onPressed,
            child: Image.asset(
              assetImagePath,
              width: 36,
              height: 36,
            ),
          ),
          Image.asset(
            paperPlanePng,
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
