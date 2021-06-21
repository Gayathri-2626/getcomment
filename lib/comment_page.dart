import 'package:flutter/material.dart';
import 'package:post_comment/commentscreen.dart';
import 'package:post_comment/showcomment.dart';

class CommentPage extends StatefulWidget {
  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<String> _comments = [];
  void _addComment(String val){
    setState(() {
      _comments.add(val);
    });
  }

  Widget _buildCommentList(){
      return ListView.builder(
        itemBuilder: (context, index){
          if(index < _comments.length){
            return _buildCommentItem(_comments[index]);
          }
        });
  }
  Widget _buildCommentItem(String comment){
    return ListTile(title: Text('Comment'),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
          title: Text('Comment',style: TextStyle(color: Colors.black,fontSize: 23),),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: EdgeInsets.only(left: 0,top: 10, right: 0),
            child: IconButton(
              icon: Icon(Icons.close,color: Colors.black,size: 30,),
              onPressed: () {},
            ),
          ),
      ),
    //   body: Column(
    //           children: [
    //             Expanded(
    //               child: _buildCommentList(),
    //             ),
    //             Align(
    //               alignment: Alignment.bottomCenter,
    //               child:
    //                 Padding(
    //                   padding: EdgeInsets.only(top: 450.0),
    //                   child:  Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   TextField(
    //                     onSubmitted: (String submittedStr){
    //                       _addComment(submittedStr);
    //                     },
    //                     decoration: InputDecoration(
    //                         contentPadding: const EdgeInsets.all(20),
    //                         hintText: "write a comment here"
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    // ),
                 body: ShowComment(),


    );
  }
}
