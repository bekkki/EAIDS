import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/login.dart';
import 'package:flutterbeki_app/authservice/authserice.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key key}) : super(key: key);
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  var name, password, token;
  int _value = 1;
  bool _obscureText = true;
  bool _obbscureText = true;
  String _name;
  String _age;
  String _password;
  String _phonenumber;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int selectedRadio;
  @override
  void _initState() {
    super.initState();
    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Widget _buildSex() {
    return Column(
      children: <Widget>[
        Text(getTranslated(context, 'sex'),
            style: TextStyle(fontWeight: FontWeight.bold)),
        Row(children: <Widget>[
          Text(getTranslated(context, 'M')),
          Radio(
              value: 1,
              groupValue: selectedRadio,
              activeColor: Colors.lightBlueAccent,
              onChanged: (val) {
                setSelectedRadio(val);
              }),
          Text(getTranslated(context, 'f')),
          Radio(
              value: 2,
              groupValue: selectedRadio,
              activeColor: Colors.pinkAccent[100],
              onChanged: (val) {
                setSelectedRadio(val);
              })
        ]),
      ],
    );
  }

  Widget _buildFirstname() {
    return TextFormField(
      maxLength: 20,
      decoration: InputDecoration(
        labelText: getTranslated(context, 'fn'),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildMiddlename() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'mn')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildLastname() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'ln')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  Widget _buildphonenumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'phone')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
    );
  }

  Widget _buildRegion() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'region')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
    );
  }

  Widget _buildZone() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'zone')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
    );
  }

  Widget _buildWoreda() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'wereda')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
    );
  }

  Widget _buildkebele() {
    return TextFormField(
      decoration: InputDecoration(labelText: getTranslated(context, 'kebele')),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
    );
  }

  Widget _buildpassword() {
    return TextFormField(
      decoration: InputDecoration(
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

  Widget _buildconfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: getTranslated(context, 'confi'),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obbscureText = !_obbscureText;
            });
          },
          child: Icon(_obbscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return getTranslated(context, 'required_field');
        }
        return null;
      },
      onSaved: (String value) {
        _phonenumber = value;
      },
      obscureText: _obbscureText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[100],
        body: ListView(
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  backgroundBlendMode: null,
                  color: Colors.green[100],
                ),
                margin: EdgeInsets.all(50),
                width: 500,
                child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildFirstname(),
                        _buildMiddlename(),
                        _buildLastname(),
                        _buildSex(),
                        _buildphonenumber(),
                        _buildRegion(),
                        _buildZone(),
                        _buildWoreda(),
                        _buildkebele(),
                        _buildpassword(),
                        _buildconfirmPassword(),
                        SizedBox(height: 100),
                        RaisedButton(
                          color: Colors.green[300],
                          child: Text(getTranslated(context, 'Regester'),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              )),
                          onPressed: () {
                            if (!_formkey.currentState.validate()) {
                              return;
                            }
                            _formkey.currentState.save();
                            print(_name);
                            print(_age);
                            print(_password);
                            print(_phonenumber);
                            AuthService()
                                .addUser(_phonenumber, _password)
                                .then((val) {
                              Fluttertoast.showToast(
                                  msg: val.data['msg'],
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green[100],
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          },
                        ),
                      ],
                    )))
          ],
        ));
  }
}
