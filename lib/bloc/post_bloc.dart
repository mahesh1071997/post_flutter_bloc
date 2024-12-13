import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
    on<MarkAsRead>(_onMarkAsRead);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final posts = data.map((e) => Post.fromJson(e)).toList();
        final timers = {for (var post in posts) post.id: (10 + (post.id % 3) * 10)};
        emit(PostLoaded(posts, timers, {}));
      } else {
        emit(PostError('Failed to load posts'));
      }
    } catch (e) {
      emit(PostError('Error: $e'));
    }
  }

  void _onMarkAsRead(MarkAsRead event, Emitter<PostState> emit) {
    if (state is PostLoaded) {
      final currentState = state as PostLoaded;
      final updatedReadPosts = Set<int>.from(currentState.readPosts)..add(event.postId);
      emit(PostLoaded(currentState.posts, currentState.timers, updatedReadPosts));
    }
  }
}
