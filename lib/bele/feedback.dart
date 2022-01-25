import 'package:flutter/material.dart';

class feedbackpage extends StatelessWidget {
  const feedbackpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Feedback page"),
        ),
        body: Center(
            child: Text(
          'Feedback Page!',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        )));
  }
}
