import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/form_list.dart';
import 'package:flutterbeki_app/UI/post.dart';
import 'package:flutterbeki_app/UI/prob.dart';
import 'package:flutterbeki_app/UI/questions_page.dart';
import 'package:flutterbeki_app/UI/regstration.dart';
import 'package:flutterbeki_app/UI/report.dart';
import 'package:flutterbeki_app/UI/splash.dart';
import 'package:flutterbeki_app/UI/st.dart';
import 'package:flutterbeki_app/authservice/authserice.dart';
import 'package:flutterbeki_app/authservice/loginfora.dart';
import 'package:flutterbeki_app/classes/language.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbeki_app/listsearch/listsearch.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';
import 'package:flutterbeki_app/sms/smshomepage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../main.dart';
import 'hepl.dart';
import 'home_page.dart';
import 'imagePicker.dart';
import 'login.dart';

class GestPage extends StatefulWidget {
  GestPage({Key key}) : super(key: key);

  @override
  _GestPageState createState() => _GestPageState();
}

class _GestPageState extends State<GestPage> {
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _password;
  String _phonenumber;
  var phone, password, token;
  String dropdownvalue = 'Flutter';
  Widget _buildSignup() {
    return Container(
        width: 400,
        child: Row(children: <Widget>[
          Text(" don't have account?    ",
              style: TextStyle(
                fontSize: 15,
              )),
          FlatButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationForm(),
                    ));
              },
              child: Text(getTranslated(context, 'createAcc'),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)))
        ]));
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        labelText: getTranslated(context, 'pass'),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
      obscureText: _obscureText,
    );
  }

  Widget _buildbutton() {
    return Container(
      width: 400,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            getTranslated(context, 'Login'),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.green[300],
          onPressed: () {
            if (!_formkey.currentState.validate()) {
              return;
            }
            _formkey.currentState.save();
          }),
    );
  }

  Widget _buildPhone() {
    return Container(
      child: TextFormField(
        maxLength: 20,
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
            // hintText: getTranslated(context, 'phone_hint'),
            prefixIcon: Icon(Icons.phone),
            labelText: getTranslated(context, 'phone_hint'),
            prefixText: '+251',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            fillColor: Colors.green[50],
            filled: true),
        validator: (String value) {
          if (value.isEmpty) {
            return getTranslated(context, "required_field");
          }
          return null;
        },
        onChanged: (val) {
          phone = val;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawer:_drawerList(),
        appBar: AppBar(backgroundColor: Colors.green[50], actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(
                8.0,
              ),
              child: Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        getTranslated(context, 'skip'),
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      )),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Help(),
                            ));
                      },
                      child: Text(
                        getTranslated(context, 'help'),
                        style: TextStyle(fontSize: 15, color: Colors.green[00]),
                      )),
                  DropdownButton(
                      onChanged: (Language language) {
                        _changeLanguage(language);
                      },
                      underline: SizedBox(),
                      icon: Icon(Icons.language, color: Colors.black),
                      items: Language.languagelist()
                          .map<DropdownMenuItem<Language>>(
                            (lang) => DropdownMenuItem(
                              value: lang,
                              child: Row(
                                children: <Widget>[
                                  Text(lang.flag),
                                  Text(lang.name)
                                ],
                              ),
                            ),
                          )
                          .toList()),
                ],
              )),
        ]),
        // drawer: Drawer(
        //   child:_drawerList(),
        // )
        body: Container(
            decoration: BoxDecoration(color: Colors.green[50]),
            child: Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: Column(
                              children: [
                                Text(getTranslated(context, 'wellcome'),
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.green[300],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                Text('EAIPC',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontSize: 40,
                                        color: Colors.green[200],
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 100),
                                _buildPhone(),
                                _buildPassword(),
                                _buildbutton(),
                                _buildSignup(),
                                SizedBox(
                                  height: 160,
                                ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.all(
                                //           Radius.circular(20))),
                                //   height: 40,
                                //   width: 150,
                                //   child: RaisedButton(
                                //     color: Colors.greenAccent[100],
                                //     child: Text(
                                //         getTranslated(context, 'submit_info'),
                                //         style: TextStyle(
                                //             fontWeight: FontWeight.bold,
                                //             color: Colors.black)),
                                //     onPressed: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //             builder: (context) => SmsHomePage(),
                                //           ));
                                //     },
                                //   ),
                                // ),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Prob(),
                                          ));
                                    },
                                    child: Text(
                                      getTranslated(context, 'skip'),
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    )),
                              ],
                            )),
                          ],
                        ),
                      ))
                ],
              ),
            )));
  }
}
