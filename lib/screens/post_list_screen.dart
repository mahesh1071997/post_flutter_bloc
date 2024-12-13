import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import '../bloc/post_state.dart';
import 'post_item.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc()..add(FetchPosts()),
      child: Scaffold(
        appBar: AppBar(title: Text('Posts')),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostError) {
              return Center(child: Text(state.message));
            } else if (state is PostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  final isRead = state.readPosts.contains(post.id);
                  final timerDuration = state.timers[post.id] ?? 10;

                  return PostItem(
                    post: post,
                    isRead: isRead,
                    timerDuration: timerDuration,
                  );
                },
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
