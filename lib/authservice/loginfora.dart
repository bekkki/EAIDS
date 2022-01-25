import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/login.dart';
import 'package:flutterbeki_app/authservice/authserice.dart';
import 'package:flutterbeki_app/UI/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name, password, token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
              hintText: "Phone number",
              prefixIcon: Icon(Icons.phone),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              fillColor: Colors.grey[200],
              filled: true),
          onChanged: (val) {
            name = val;
          },
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              hintText: 'password',
              prefixIcon: Icon(Icons.lock),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
              fillColor: Colors.grey[200],
              filled: true),
          onChanged: (val) {
            password = val;
          },
        ),
        SizedBox(height: 10),
        RaisedButton(
            child: Text('Authenticate'),
            color: Colors.cyan,
            onPressed: () {
              AuthService().login(name, password).then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => MyHomePage(),
                  //     ));
                  Fluttertoast.showToast(
                      msg: 'Authentiated',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              });
            }),
        SizedBox(height: 10),
        RaisedButton(
            child: Text('Add User'),
            color: Colors.green,
            onPressed: () {
              AuthService().addUser(name, password).then((val) {
                Fluttertoast.showToast(
                    msg: val.data['msg'],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
            }),
      ],
    ));
  }
}
