import 'dart:convert';
import 'package:demo/service/local_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  final prefs = SharedPreferencesService.instance;
//   await prefs.init();

//   await prefs.saveString("username", "Mahesh");
//   String? username = prefs.getString("username");
  Future<String> fetchPosts() async {
    if (prefs.getString("post") != null) {
      return Future.value(prefs.getString("post"));
    } else {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // synce and save data 
        await prefs.saveString("post", response.body);
        return response.body;
      } else {
        throw Exception('Failed to fetch posts');
      }
    }
  }

  Future<String> fetchPostDetails(String postId) async {
    // https://jsonplaceholder.typicode.com/posts/$postId

    if (prefs.getString("post$postId") != null) {
      return Future.value(prefs.getString("post$postId"));
    }
     else {
      final response = await http.get(Uri.parse("$baseUrl/$postId"));
      if (response.statusCode == 200) {
        await prefs.saveString("post$postId", response.body);
        // print("object ${prefs.getString("post$postId")!}");
        return response.body;
      } else {
        throw Exception('Failed to fetch posts');
      }
    }
  }
}
