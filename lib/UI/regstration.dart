import 'package:flutter/material.dart';
import 'package:flutterbeki_app/authservice/connection.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  var confirm;
  var firstName,
      middleName,
      lastName,
      sex,
      phone,
      region,
      zone,
      wereda,
      kebelie,
      password,
      role,
      confirmPassword,
      token;
  int _value = 1;
  bool _obscureText = true;
  bool _obbscureText = true;
  String _name = "";
  String _age = "";
  String _password = "";
  String _phonenumber = "";
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  int selectedRadio = 0;
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

  Widget _buildFirstname() {
    return TextFormField(
      //  maxLength: 20,
      //  decoration: InputDecoration(labelText: 'First Name'),
      onChanged: (val) {
        firstName = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'First Name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Widget _buildMiddlename() {
    return TextFormField(
      // decoration: InputDecoration(labelText: 'Midle Name'),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Midle Name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        middleName = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildLastname() {
    return TextFormField(
      // decoration: InputDecoration(labelText: 'Last Name'),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Last Name',
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        lastName = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildphonenumber() {
    return TextFormField(
      //decoration: InputDecoration(labelText: 'phone'),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Phone',
        prefixIcon: Icon(
          Icons.call,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        phone = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildRegion() {
    return TextFormField(
      //decoration: InputDecoration(labelText: 'region'),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Region',
        prefixIcon: Icon(
          Icons.location_city,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        region = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildZone() {
    return TextFormField(
      //decoration: InputDecoration(labelText: 'zone'),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Zone',
        prefixIcon: Icon(
          Icons.location_city_rounded,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        zone = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildWoreda() {
    return TextFormField(
      //decoration: InputDecoration(labelText: 'wereda'),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Wereda',
        prefixIcon: Icon(
          Icons.location_city_sharp,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        wereda = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildkebele() {
    return TextFormField(
      //decoration: InputDecoration(labelText: 'kebele'),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'Kebele',
        prefixIcon: Icon(
          Icons.home_work,
          color: Colors.green,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (val) {
        kebelie = val;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
    );
  }

  Widget _buildpassword() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'password',
        prefixIcon: Icon(
          Icons.lock,
          color: Colors.green,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: (value) {
        confirm = value;
        if (value == null || value.isEmpty) {
          return 'The title must be write!!!';
        }
        return null;
      },
      obscureText: _obscureText,
      onChanged: (val) {
        password = val;
      },
    );
  }

  Widget _buildconfirmPassword() {
    return TextFormField(
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'confirm password',
        prefixIcon: Icon(Icons.lock, color: Colors.green),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obbscureText = !_obbscureText;
            });
          },
          child: Icon(_obbscureText ? Icons.visibility : Icons.visibility_off),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty || (password != value)) {
          return 'Password is not match!';
        }
        return null;
      },
      obscureText: _obbscureText,
      onChanged: (val) {
        confirmPassword = val;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Container(
                color: Colors.white,
                margin: EdgeInsets.all(10),
                child: Form(
                    key: _formkey,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Registration Form",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _buildFirstname(),
                            SizedBox(height: 10),
                            _buildMiddlename(),
                            SizedBox(height: 10),
                            _buildLastname(),
                            SizedBox(height: 10),
                            // _buildSex(),
                            _buildphonenumber(),
                            SizedBox(height: 10),
                            _buildRegion(),
                            SizedBox(height: 10),
                            _buildZone(),
                            SizedBox(height: 10),
                            _buildWoreda(),
                            SizedBox(height: 10),
                            _buildkebele(),
                            SizedBox(height: 10),
                            _buildpassword(),
                            SizedBox(height: 10),
                            _buildconfirmPassword(),
                            SizedBox(height: 20),
                            RaisedButton(
                              color: Colors.green[300],
                              child: Text('Regester',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                              onPressed: () {
                                if (!_formkey.currentState.validate()) {
                                  return;
                                }
                                _formkey.currentState.save();

                                AuthService()
                                    .addregistration(
                                        firstName,
                                        middleName,
                                        lastName,
                                        phone,
                                        region,
                                        zone,
                                        wereda,
                                        kebelie,
                                        password,
                                        "farmer")
                                    .then((val) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrationForm(),
                                      ));
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )))
          ],
        ));
  }
}
