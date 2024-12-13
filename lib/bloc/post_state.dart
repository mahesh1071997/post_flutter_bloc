import '../models/post_model.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final Map<int, int> timers;
  final Set<int> readPosts;

  PostLoaded(this.posts, this.timers, this.readPosts);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}
