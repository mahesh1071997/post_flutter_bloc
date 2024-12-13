abstract class PostEvent {}

class FetchPosts extends PostEvent {}

class MarkAsRead extends PostEvent {
  final int postId;
  MarkAsRead(this.postId);
}
