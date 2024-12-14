import 'package:demo/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post_model.dart';

class PostDetailScreen extends StatelessWidget {
  final int postId;

  PostDetailScreen({required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Detail')),
      body: FutureBuilder<String>(
        future: ApiService.fetchPostDetails("$postId"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final post = Post.fromJson(json.decode(snapshot.data!));
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                  SizedBox(height: 16.0),
                  Text(post.body),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
