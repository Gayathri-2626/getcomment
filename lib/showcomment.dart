import 'package:flutter/material.dart';
import 'package:post_comment/userlist.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShowComment extends StatefulWidget {
  @override
  _ShowCommentState createState() => _ShowCommentState();
}

class _ShowCommentState extends State<ShowComment> {

  Future<List<User>> _getUsers() async{
    final url ="http://pixflutter.pixalive.me/api/user/getpost_comments?post_id=60a504d0647271356832ddb1";
    var data = await http.get(url, headers: {
    'token': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNjBhZGRiYjYxMTM2NmI1OWNlYWI1MGNlIn0sImlhdCI6MTYyMjAxMTEyOCwiZXhwIjoxNjI5Nzg3MTI4fQ.w3J-pkRI9tDuqnBUWvqAtsECoAcDwtra4INV7zSrk6w'});

    var jsonData = json.decode(data.body);
    print(data.body);

    List<User> users=[];
    for(var u in jsonData['result']) {
      User user = User(u["user_id"], u["comment"],);

      users.add(user);
    }
    print(users.length);
    return users;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: _getUsers(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              print(snapshot.data);
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text('Loading...'),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    //         shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index ) =>
                        Container(
                          width: MediaQuery.of(context).size.width,
                          //      padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                          child: Card(
                            elevation: 0.5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(width: 55.0, height: 55.0,
                                        //color: Colors.grey,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          foregroundColor: Colors.grey,
                                          backgroundImage: NetworkImage(
                                              "https://randomuser.me/api/portraits/men/0.jpg"),
                                        ),),
                                      SizedBox(width: 10.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(snapshot.data[index].user_id,style: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold)),
                                          SizedBox(height: 5,),
                                          Text(snapshot.data[index].comment,style: TextStyle(color: Colors.grey)),
                                        ],
                                      )
                                    ],
                                  ),
                                  // Container(
                                  //   child: Text(snapshot.data[index].created_at,style: TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.bold),
                                  // )
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ));
                // ListView.builder(
                //       itemCount: snapshot.data.length,
                //       itemBuilder: (BuildContext context, int index) {
                //         return ListTile(
                //           leading: CircleAvatar(
                //             backgroundColor: Colors.grey,
                //             backgroundImage: NetworkImage(snapshot.data[index]
                //                 .avatar),
                //           ),
                //           title: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: <Widget>[
                //               new Text(snapshot.data[index].firstname,
                //                   style: TextStyle(
                //                     fontSize: 12.0,
                //                     fontWeight: FontWeight.bold,
                //                   )),
                //               new FlatButton(onPressed: null, child: null)
                //             ],
                //           ),
                //           subtitle: Text(
                //             snapshot.data[index].username,
                //             style: TextStyle(color: Colors.grey, fontSize: 12.0),
                //           ),
                //         );
                //       });
              }
            }
        ),
      ),
    );
  }
}


//   return new ListView.builder(
  //     itemCount: list.length,
  //     itemBuilder: (BuildContext context, int index)=>new Column(
  //       children: [
  //         new Divider(height: 5.0,),
  //         new ListTile(
  //           leading:  CircleAvatar(
  //             radius: 28,
  //             backgroundImage: AssetImage(list[index].dp),
  //           ),
  //           title: Text(list[index].userName,style: TextStyle(fontSize: 15),),
  //           subtitle: Text(list[index].lastMessage,style: TextStyle(fontSize: 13),),
  //           trailing: Text(list[index].time,style: TextStyle(fontSize: 12),),
  //         ),
  //       ],
  //     ),
  //   );
  //
  //
  // }

  class User{
  final String user_id ;
  final String comment;

  User(this.user_id, this.comment);
}

