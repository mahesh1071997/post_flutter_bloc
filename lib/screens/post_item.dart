import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/post_bloc.dart';
import '../bloc/post_event.dart';
import 'post_detail_screen.dart';
import '../models/post_model.dart';

class PostItem extends StatefulWidget {
  final Post post;
  final bool isRead;
  final int timerDuration;

  PostItem({required this.post, required this.isRead, required this.timerDuration});

  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  late int remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.timerDuration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remainingTime--;
        if (remainingTime <= 0) {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _timer?.cancel();
        BlocProvider.of<PostBloc>(context).add(MarkAsRead(widget.post.id));
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PostDetailScreen(postId: widget.post.id)),
        ).then((_) => _startTimer());
      },
      child: Container(
        color: widget.isRead ? Colors.white : Colors.yellow[100],
        padding: EdgeInsets.all(16.0),
        child: ListTile(
          title:Text(widget.post.title, style: TextStyle(fontWeight: FontWeight.bold)) ,
          subtitle:Text(widget.post.body, maxLines: 3, overflow: TextOverflow.ellipsis) ,
          trailing:  Column(
              children: [
                const Icon(Icons.timer),
                Text('$remainingTime s', style: TextStyle(color: Colors.red)),
              ],
            ),
          
        ),
            ),
    );
  }
}
