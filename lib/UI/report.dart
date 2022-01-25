import 'package:flutter/material.dart';
import 'package:flutterbeki_app/UI/post.dart';
import 'package:flutterbeki_app/authservice/connection.dart';

class reportProblem extends StatefulWidget {
  @override
  _reportProblemState createState() => _reportProblemState();
}

class _reportProblemState extends State<reportProblem> {
  final _formKey = GlobalKey<FormState>();
  var problemTitle,
      problemDescription,
      problemImage,
      date = "Sebtember 3 2014",
      reporterId = "Belete";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporting Problem'),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
              width: 50,
            ),
            Center(
              child: Title(
                  color: Colors.blue,
                  child: Text(
                    "Problem Title",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'The title must be write!!!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Write a problem ......',
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
                ),
                onChanged: (val) {
                  problemTitle = val;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Title(
                  color: Colors.blue,
                  child: Text(
                    "Description of the problem",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextFormField(
                minLines: 6,
                maxLines: 20,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Must be write some description about the problem!!!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Write the detail of the problem....',
                  hintStyle: TextStyle(
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  )),
                ),
                onChanged: (val) {
                  problemDescription = val;
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: RaisedButton(
                    child: Text("send"),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        AuthService()
                            .addproblem(problemTitle, problemDescription,
                                problemImage, date, reporterId)
                            .then((val) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => dataFromDatabase(),
                              ));
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Successfully Send.')),
                        );
                      }
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
