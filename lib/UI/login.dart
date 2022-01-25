import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/form_list.dart';
import 'package:flutterbeki_app/UI/splash.dart';
import 'package:flutterbeki_app/authservice/authserice.dart';
import 'package:flutterbeki_app/authservice/loginfora.dart';
import 'package:flutterbeki_app/UI/basic%20_info.dart';
import 'package:flutterbeki_app/UI/home_page.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';
import 'package:flutterbeki_app/testform.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _name;
  String _age;
  String _password;
  String _phonenumber;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Widget _buildname() {
    return TextFormField(
      maxLength: 20,
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
          // hintText: getTranslated(context, 'phone_hint'),
          prefixIcon: Icon(Icons.phone),
          labelText: getTranslated(context, 'phone_hint'),
          // prefixText: '+251',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          fillColor: Colors.green[50],
          filled: true),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, "required_field");
        }
        return null;
      },
      onChanged: (val) {
        name = val;
      },
    );
  }

  var name, password, token;
  String dropdownvalue = 'Flutter';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Easy Farm'),
        // ),
        body: Container(
      color: Colors.green[100],
      child: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70),
            //  mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Text(
                getTranslated(context, 'login'),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 340,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[100],
                  ),
                  child: ListView(
                    children: [
                      _buildname(),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: getTranslated(context, 'pass_hint'),
                            prefixIcon: Icon(Icons.lock),
                            // prefixText: '+251',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            fillColor: Colors.green[50],
                            filled: true),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FormScreen(),
                                  ));
                            },
                            child: Text(
                              getTranslated(context, 'accreate'),
                              style: TextStyle(fontSize: 25),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              getTranslated(context, 'sign_in'),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.green[300],
                            onPressed: () {
                              AuthService().login(name, password).then((val) {
                                if (val.data['success']) {
                                  token = val.data['token'];
                                  // var userData = val.data['user'];
                                  // var role =userData['role'];
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyHomePage(),
                                      ));
                                  // Fluttertoast.showToast(
                                  //     msg: 'Authentiated',
                                  //     toastLength: Toast.LENGTH_SHORT,
                                  //     gravity: ToastGravity.BOTTOM,
                                  //     timeInSecForIosWeb: 1,
                                  //     backgroundColor: Colors.green,
                                  //     textColor: Colors.white,
                                  //     fontSize: 16.0);
                                  print("authenticated");
                                } else {
                                  print("Authentication error");
                                }
                              });
                            }),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
    ));
  }
}
