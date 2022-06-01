import 'package:feed_tab/models/user_model.dart';

abstract class FeedTabState {}

class InitialFeedTabState extends FeedTabState {}

class SuccessFeedTabState extends FeedTabState {
  final List<UserModel> userModel;

  SuccessFeedTabState(this.userModel);
}

class LoadingFeedTabState extends FeedTabState {}

class ErrorFeedTabState extends FeedTabState {
  final String message;

  ErrorFeedTabState(this.message);
}
