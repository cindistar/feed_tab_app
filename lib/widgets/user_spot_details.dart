import 'package:feed_tab/widgets/custom_circle_avatar.dart';
import 'package:feed_tab/widgets/shadow_text.dart';
import 'package:flutter/material.dart';

class UserSpotDetails extends StatelessWidget {
  final String photoUrl;
  final String usernameOrFoodName;
  final String userFullNameOrLocationName;
  final Color color;
  final IconButton iconButton;
  const UserSpotDetails({
    super.key,
    required this.photoUrl,
    required this.usernameOrFoodName,
    required this.userFullNameOrLocationName,
    required this.color,
    required this.iconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: CustomCircleAvatar(
            photoUrl: photoUrl,
            radiusFirst: 36,
            radiusSecond: 30,
            color: color,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWithShadow(
              text: usernameOrFoodName,
              fontSize: 22,
              color: Colors.white,
            ),
            const SizedBox(height: 3),
            TextWithShadow(
              text: userFullNameOrLocationName,
              fontSize: 18,
              color: const Color.fromARGB(255, 223, 219, 219),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 22),
          child: iconButton,
        ),
      ],
    );
  }
}
