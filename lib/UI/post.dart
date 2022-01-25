import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/report.dart';
import 'package:flutterbeki_app/UI/search.dart';
import 'package:flutterbeki_app/authservice/connection.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

import 'guest_page.dart';
import 'innovativeIdea.dart';

class dataFromDatabase extends StatefulWidget {
  @override
  _dataFromDatabaseState createState() => _dataFromDatabaseState();
}

class _dataFromDatabaseState extends State<dataFromDatabase> {
  bool liked = false;

  final _formKey = GlobalKey<FormState>();
  var comments,
      commenterId = "Belete",
      postId = "Postes",
      date = "September 3 2014";

  // _pressed() {
  //   setState(() {
  //     liked = !liked;
  //   });
  // }

  getPostData() async {
    var response = await http
        .get(Uri.https('firstappwithheroku.herokuapp.com', 'getposts'));
    var jsonData = jsonDecode(response.body);
    List<post> users = [];
    for (var u in jsonData) {
      post user = post(u["postTitle"], u["postMessage"], u["postImages"],
          u["date"], u["postType"]);
      users.add(user);
    }
    print("hello");
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("አዲስ ሁነቶች "),
        backgroundColor: Colors.green[200],
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GestPage(),
                    ));
              },
              icon: Icon(Icons.logout, color: Colors.white)),
        ],
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: getPostData(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                var data = (snapshot.data as List<post>).toList();
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      if (data[i].postType == "alert") {
                        return ListTile(
                          title: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.blueGrey,
                            child: Container(
                              child: Column(
                                children: [
                                  //title: Text(snapshot.data.length),
                                  Text(
                                    "አስቸኳይ!!!",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                  Text(
                                    data[i].postTitle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.red),
                                  ),
                                  ReadMoreText(
                                    data[i].postMessage,
                                    trimLines: 2,
                                    //colorClickableText: Colors.blue,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'ሙሉ አንብብ',
                                    trimExpandedText: 'ጽሁፉን ደብቅ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    // moreStyle: TextStyle(
                                    //     fontSize: 14, fontWeight: FontWeight.bold,color: Colors.green),
                                    //  delimiterStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.pink)
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 44,
                                      minHeight: 44,
                                    ),
                                    child: Image.network(
                                      data[i].postImages,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(data[i].date),
                                  Container(
                                    width: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .width,
                                    height: 50,
                                    // child: TextField(
                                    //   decoration: InputDecoration(
                                    //     border: OutlineInputBorder(
                                    //         borderRadius:
                                    //             BorderRadius.circular(15)),
                                    //     suffixIcon: Icon(
                                    //       Icons.send,
                                    //       color: Colors.blue,
                                    //     ),
                                    //     hintText: 'write comments...',
                                    //   ),
                                    //   keyboardType: TextInputType.name,
                                    //   textInputAction: TextInputAction.done,
                                    //   onChanged: (val) {
                                    //     comments = val;
                                    //   },
                                    // ),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'You should write a comment!!!';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        comments = val;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            AuthService()
                                                .comment(
                                              comments,
                                              commenterId,
                                              postId,
                                              date,
                                            )
                                                .then((val) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        dataFromDatabase(),
                                                  ));
                                            });
                                            if (_formKey.currentState
                                                .validate()) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Successfully Send.')),
                                              );
                                            }
                                          },
                                        ),
                                        hintText: 'write comments...',
                                      ),
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return ListTile(
                          title: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: Colors.white,
                            shadowColor: Colors.black,
                            child: Container(
                              child: Column(
                                children: [
                                  //title: Text(snapshot.data.length),
                                  Text(
                                    data[i].postTitle,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.blue),
                                  ),
                                  ReadMoreText(
                                    data[i].postMessage,
                                    trimLines: 2,
                                    //colorClickableText: Colors.blue,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: 'ሙሉ አንብብ',
                                    trimExpandedText: 'ጽሁፉን ደብቅ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                    // moreStyle: TextStyle(
                                    //     fontSize: 14, fontWeight: FontWeight.bold,color: Colors.green),
                                    //  delimiterStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.pink)
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minWidth: 44,
                                      minHeight: 44,
                                    ),
                                    child: Image.network(
                                      data[i].postImages,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(data[i].date),
                                  Container(
                                    width: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .width,
                                    height: 50,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'You should write a comment!!!';
                                        }
                                        return null;
                                      },
                                      onChanged: (val) {
                                        comments = val;
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send),
                                          onPressed: () {
                                            AuthService()
                                                .comment(
                                              comments,
                                              commenterId,
                                              postId,
                                              date,
                                            )
                                                .then((val) {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        dataFromDatabase(),
                                                  ));
                                            });
                                            if (_formKey.currentState
                                                .validate()) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Successfully Send.')),
                                              );
                                            }
                                          },
                                        ),
                                        hintText: 'write comments...',
                                      ),
                                      keyboardType: TextInputType.name,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    });
              }
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              //arrowColor: Colors.green[100],
              decoration: BoxDecoration(
                color: Colors.green[100],
                image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage("assets/farmer.jpg"),
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              accountName: Text(
                'Belete Alehegn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15),
              ),
              accountEmail: Text('hilegiorgisbelete@gmail.com'),
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.engineering),
              title: Text('Exploring innovative idea'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => Exploringidea()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.people),
              title: Text('Discussion forum'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Exploringidea(),
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                // Navigator.pop(context1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Exploringidea(),
                  ),
                );
              },
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.people),
              title: Text('Reporting problems'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => reportProblem(),
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => Exploringidea()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class post {
  final String postTitle, postMessage, postImages, date, postType;

  post(this.postTitle, this.postMessage, this.postImages, this.date,
      this.postType);

  @override
  String toString() =>
      'post(postTitle,postMessage,postImages,date: $postTitle,postMessage,postImages,date)';
}
