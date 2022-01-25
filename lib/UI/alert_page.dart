import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showAlert() {
      Alert(context: context, title: "urgent", desc: 'ther is sudden wilde')
          .show();
    }

    return Scaffold(body: showAlert());
  }
}
