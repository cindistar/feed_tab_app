import 'package:carousel_slider/carousel_slider.dart';
import 'package:feed_tab/view_models/feed_view_model.dart';
import 'package:feed_tab/view_models/states.dart';
import 'package:feed_tab/widgets/heart_animation.dart';
import 'package:feed_tab/widgets/recommendation_view_items.dart';
import 'package:feed_tab/widgets/tags_ui_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedTabView extends StatefulWidget {
  const FeedTabView({super.key});

  @override
  State<FeedTabView> createState() => _FeedTabViewState();
}

class _FeedTabViewState extends State<FeedTabView> {
  bool isHeartAnimation = false;
  bool isLiked = false;
  bool hasTag = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FeedViewModel>().fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controllerViewModel = context.watch<FeedViewModel>();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: AppBar(
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: SizedBox(
                    height: 40,
                    child: Text('Feed',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )))),
            elevation: 0,
            backgroundColor: Colors.white,
          )),
      body: ValueListenableBuilder(
        valueListenable: controllerViewModel,
        builder: (_, state, __) {
          if (state is LoadingFeedTabState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          }
          if (state is ErrorFeedTabState) {
            return Text(state.message);
          }
          if (state is SuccessFeedTabState) {
            return SizedBox(
              width: 412,
              height: 800,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.userModel.length,
                  itemBuilder: ((context, index) {
                    final user = state.userModel[index];
                    return Column(children: [
                      GestureDetector(
                          child: Stack(children: [
                            SizedBox(
                                width: 400,
                                height: 520,
                                child: CarouselSlider.builder(
                                    options: CarouselOptions(
                                      height: 520,
                                      viewportFraction: 1,
                                      enableInfiniteScroll: false,
                                      scrollPhysics: const BouncingScrollPhysics(),
                                    ),
                                    itemCount: user.media.length,
                                    itemBuilder: (BuildContext context, int index2, int realIndex) {
                                      return Image.network(
                                        user.media[index2].url,
                                        fit: BoxFit.fill,
                                      );
                                    })),
                            RecommendationViewItems(
                              userName: user.author.username,
                              userFullName: user.author.fullName,
                              photoUserUrl: user.author.photoUrl,
                              logoUrl: user.spot.logo.url,
                              food: user.spot.name,
                              location: user.spot.location.display,
                              captionText: user.caption.text,
                            ),
                            Container(
                                padding: const EdgeInsets.only(top: 200),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Opacity(
                                        opacity: isHeartAnimation ? 1 : 0,
                                        child: HeartAnimationWidget(
                                          isAnimating: isHeartAnimation,
                                          duration: const Duration(milliseconds: 700),
                                          child: const Icon(
                                            Icons.favorite,
                                            size: 100,
                                            color: Colors.red,
                                          ),
                                          onEnd: () => setState(() => isHeartAnimation = false),
                                        ))))
                          ]),
                          onDoubleTap: () {
                            setState(() {
                              isHeartAnimation = true;
                              isLiked = true;
                            });
                          }),
                      const SizedBox(height: 8),
                      Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: SizedBox(
                              width: 380,
                              height: hasTag ? 35 : 0,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0.5),
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: user.tags?.length ?? 0,
                                  itemBuilder: (context, index3) {
                                    return TagUICard(
                                      tags: user.tags?[index3].name ?? '',
                                    );
                                  }))),
                      const SizedBox(height: 16),
                      Row(children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: SizedBox(
                                height: 18,
                                width: 100,
                                child: Text(timeago.format(user.createdAt),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 185, 182, 182),
                                    ))))
                      ]),
                      const SizedBox(height: 32),
                    ]);
                  })),
            );
          }
          return Container();
        },
      ),
    );
  }
}
