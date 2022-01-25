import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// This is a very simple class, used to
/// demo the `SearchPage` package
getPostData() async {
  var response =
      await http.get(Uri.https('flutterauthtest1.herokuapp.com', 'getposts'));
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

class post {
  final String postTitle, postMessage, postImages, date, postType;

  post(this.postTitle, this.postMessage, this.postImages, this.date,
      this.postType);

  @override
  String toString() =>
      'post(postTitle,postMessage,postImages,date: $postTitle,postMessage,postImages,date)';
}
