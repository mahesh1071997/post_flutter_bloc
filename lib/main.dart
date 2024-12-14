// import 'package:demo/list_view.dart';
import 'package:demo/screens/post_list_screen.dart';
import 'package:demo/service/local_service.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.instance.init();

  runApp(MaterialApp(
    home: PostListScreen(),
  ));
}
