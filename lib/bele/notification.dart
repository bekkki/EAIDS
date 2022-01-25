import 'package:flutter/material.dart';

class notificationpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text("Notification page"),
        ),
        body: Center(
            child: Text(
          'Notification Page!',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
        )));
  }
}
