import 'package:flutter/material.dart';
class privateComment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Private comment"),
        ),
       body:
        Center(
          child: Text('Private comment Page!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),)
        )
    
    );
  }
}