import 'package:flutter/material.dart';
import 'package:post_comment/showcomment.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )
        ),
        child: ShowComment(),
      ),
    );
  }
  }