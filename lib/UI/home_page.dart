import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:flutterbeki_app/UI/report.dart';
import 'package:flutterbeki_app/UI/search.dart';

import 'package:flutterbeki_app/bele/privatecomment.dart';
import 'package:flutterbeki_app/bele/settingsPage.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';

import 'basic _info.dart';
import '../bele/feedback.dart';
import 'innovativeIdea.dart';
import '../bele/notification.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _ScaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        title: Text(getTranslated(context, 'Regester')),
        backgroundColor: Colors.green[200],
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz, color: Colors.white)),
        ],
      ),
      body: Container(
        color: Colors.green[50],
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            Center(child: Text('የአርሶ አደሩን ጉልበት የሚቀንስ ልዩ የጤፍ ማጨጃ ማሽን')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
            Image(
              image: AssetImage('assets/teffcutter.jpg'),
              width: 450,
              height: 200,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      hintText: 'write comments...',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            Center(child: Text('የመስኖ እርሻ በ AASTU')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
            Image(
              image: AssetImage('assets/f4.jpg'),
              width: 450,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      hintText: 'write comments...',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            ),
            Center(child: Text('የበቆሎ አዝርት በ ውልቂጤ')),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
            ),
            Image(
              image: AssetImage('assets/ba1.jpg'),
              width: 450,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[500].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      hintText: 'write comments...',
                    ),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                  ),
                ),
              ),
            ),
            Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.pink[500].withOpacity(0.2),
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              arrowColor: Colors.green[100],
              decoration: BoxDecoration(
                color: Colors.green[100],
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    image: AssetImage('assets/farmer.jpg'),
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              accountName: Text(
                'Belete Alehegn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15),
              ),
              accountEmail: Text('hilegiorgisbelete@gmail.com'),
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.engineering),
              title: Text(getTranslated(context, 'Exploring_innovative_idea')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => Exploringidea()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.people),
              title: Text(getTranslated(context, 'Discussion_forum')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => discussionpage(),
                  ),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.notifications),
              title: Text(getTranslated(context, 'Notifications')),
              onTap: () {
                // Navigator.pop(context1);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => notificationpage(),
                  ),
                );
              },
              trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: Center(
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.feedback),
              title: Text(getTranslated(context, 'BasicInfo')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => BasicInfo()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.comment),
              title: Text('report Problem'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => reportProblem()),
                );
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.settings),
              title: Text(getTranslated(context, 'settings')),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context1) => settingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  discussionpage() {}
}
