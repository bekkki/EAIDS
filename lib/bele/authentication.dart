import 'package:flutter/material.dart';

import 'mainPage.dart';

class authentication extends StatelessWidget {
  var kBodyText;
  // ignore: non_constant_identifier_names
  static var PhoneNumber, password;
  void _phonenumbers(String phone) {
    PhoneNumber = phone;
    return PhoneNumber;
  }

  String _passwords(String pass) {
    password = pass;
    return password;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black, Colors.transparent],
          ).createShader(rect),
          blendMode: BlendMode.darken,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/background2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            )),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              Center(
                child: Text(
                  'Wellcome to EasyFarming',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.person,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Full Name',
                        hintStyle: kBodyText,
                      ),
                      style: kBodyText,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextFormField(
                      validator: (value) {
                        PhoneNumber = value;
                        print(PhoneNumber);
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.phone,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Phone Number',
                      ),
                      style: kBodyText,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[500].withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextFormField(
                      validator: (pass) {
                        password = pass;
                        print(password);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.lock,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'Password',
                        hintStyle: kBodyText,
                        suffixIcon: Icon(
                          Icons.visibility,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                      obscureText: true,
                      style: kBodyText,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                height: 10,
              ),
              // Checkbox(value: true, onChanged: null),
              // Text('stay log'),
              RaisedButton(
                  color: Colors.grey,
                  hoverColor: Colors.blue,
                  child: Text("Register"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context1) => loginpage()),
                    );
                    _phonenumbers(PhoneNumber);
                    _passwords(password);
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
