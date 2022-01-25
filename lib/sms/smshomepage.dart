import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterbeki_app/UI/about.dart';
import 'package:flutterbeki_app/UI/basic%20_info.dart';
import 'package:flutterbeki_app/UI/innovativeIdea.dart';
import 'package:flutterbeki_app/UI/report.dart';
import 'package:flutterbeki_app/UI/search.dart';
import 'package:flutterbeki_app/bele/notification.dart';
import 'package:flutterbeki_app/bele/privatecomment.dart';
import 'package:flutterbeki_app/bele/settingsPage.dart';
import 'package:flutterbeki_app/localization/language_constants.dart';

class SmsHomePage extends StatefulWidget {
  final String title;

  SmsHomePage({Key key, this.title}) : super(key: key);

  @override
  _SmsHomePageState createState() => _SmsHomePageState();
}

class _SmsHomePageState extends State<SmsHomePage> {
  final GlobalKey<ScaffoldState> _ScaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        title: Text("SMS-Page"),
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
      body: Container(),
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
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.people),
              title: Text("About"),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationVersion: ' V 0.0.1',
                    applicationName: 'EAIPC',
                    applicationLegalese: 'Developerrs',
                    children: <Widget>[
                      Text("Bereket Woldesilasie"),
                      Text("Belete Alehegn")
                    ]);
              },
            ),
            ListTile(
              tileColor: Colors.green[50],
              leading: Icon(Icons.people),
              title: Text("Help"),
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: FlutterLogo(),
                    applicationVersion: ' V 0.0.1',
                    applicationName: 'EAIPC',
                    applicationLegalese: 'Developerrs',
                    children: <Widget>[
                      Text("Bereket Woldesilasie"),
                      Text("Belete Alehegn")
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }

  discussionpage() {}
}
