import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterbeki_app/UI/form_list.dart';
import 'package:flutterbeki_app/UI/login.dart';
import 'package:flutterbeki_app/authservice/loginfora.dart';
import 'package:flutterbeki_app/router/custom_router.dart';
import 'package:flutterbeki_app/router/route_constants.dart';

import 'UI/guest_page.dart';
import 'UI/imagePicker.dart';
import 'UI/innovativeIdea.dart';
import 'UI/splash.dart';
import 'UI/basic _info.dart';
import 'localization/demo_localization.dart';
import 'localization/language_constants.dart';

//import 'UI/home.dart';

// //void main() => runApp(Scanf());
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800])),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ethiopian Agricaltural Information Provision Center",
        theme: ThemeData(primarySwatch: Colors.blue),
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("am", "ET"),
          Locale("hi", "IN"),
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        onGenerateRoute: CustomRouter.generatedRoute,
        initialRoute: homeRoute,
        home: SplashPic(),
      );
    }
  }
}
