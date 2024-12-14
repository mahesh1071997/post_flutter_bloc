import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<String> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  static Future<String> fetchPostDetails(String postId) async {
    // https://jsonplaceholder.typicode.com/posts/$postId
    final response = await http.get(Uri.parse("$baseUrl/$postId"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to fetch posts');
    }
  }
}
