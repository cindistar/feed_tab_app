import 'package:feed_tab/widgets/caption_text.dart';
import 'package:feed_tab/widgets/more_less_text.dart';
import 'package:feed_tab/widgets/toolbar.dart';
import 'package:feed_tab/widgets/user_spot_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommendationViewItems extends StatefulWidget {
  final String userName;
  final String userFullName;
  final String photoUserUrl;
  final String? mediaPhotoUrl;
  final String logoUrl;
  final String food;
  final String location;
  final String captionText;
  final String? tags;
  const RecommendationViewItems({
    super.key,
    required this.userName,
    required this.userFullName,
    required this.photoUserUrl,
    this.mediaPhotoUrl,
    required this.logoUrl,
    required this.food,
    required this.location,
    required this.captionText,
    this.tags,
  });

  @override
  State<RecommendationViewItems> createState() => _RecommendationViewItemsState();
}

class _RecommendationViewItemsState extends State<RecommendationViewItems> {
  bool _isStarPressed = false;
  bool _isHeartClicked = false;
  bool _isMoreText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRecommendationViewItems(),
        _buildToolbar(),
        _buildCaption(),
      ],
    );
  }

  Widget _buildRecommendationViewItems() {
    return Column(
      children: [
        Stack(
          children: [
            UserSpotDetails(
              photoUrl: widget.photoUserUrl,
              usernameOrFoodName: widget.userName,
              userFullNameOrLocationName: widget.userFullName,
              color: const Color.fromARGB(255, 231, 95, 140),
              iconButton: IconButton(
                icon: const Icon(
                  Icons.more_horiz_outlined,
                  size: 37,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 414),
              child: UserSpotDetails(
                photoUrl: widget.logoUrl,
                usernameOrFoodName: widget.food,
                userFullNameOrLocationName: widget.location,
                color: Colors.white,
                iconButton: IconButton(
                  icon: Icon(
                    _isStarPressed == true ? CupertinoIcons.star_fill : CupertinoIcons.star,
                    size: 37,
                    color: _isStarPressed == true ? Colors.amber : Colors.white,
                  ),
                  onPressed: () => setState(() => _isStarPressed = !_isStarPressed),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildToolbar() {
    return Column(
      children: [
        ToolBar(
          onPressed: () => setState(
            () => _isHeartClicked = !_isHeartClicked,
          ),
          assetImagePath: _isHeartClicked == true ? 'assets/images/red_heart.png' : 'assets/images/heart_border.png',
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildCaption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: SizedBox(
            width: 350,
            height: 40,
            child: Column(
              children: [
                Stack(
                  children: [
                    CaptionText(
                      captionText: widget.captionText,
                      userName: widget.userName,
                    ),
                    Positioned(
                      top: 10,
                      right: 0,
                      child: MoreLessText(
                        text: _isMoreText ? 'more...' : 'less...',
                        onPressed: () => setState(() => _isMoreText = !_isMoreText),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
