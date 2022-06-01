import 'package:feed_tab/repositories/feed_repository.dart';
import 'package:feed_tab/view_models/states.dart';
import 'package:flutter/material.dart';

class FeedViewModel extends ValueNotifier<FeedTabState> {
  final FeedRepository feedViewModel;

  FeedViewModel(this.feedViewModel) : super(InitialFeedTabState());

  Future fetch() async {
    value = LoadingFeedTabState();
    try {
      final userModel = await feedViewModel.getUsers();
      value = SuccessFeedTabState(userModel);
    } catch (e) {
      value = ErrorFeedTabState(e.toString());
    }
  }
}
