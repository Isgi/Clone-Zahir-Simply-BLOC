import 'package:flutter/material.dart';

import 'package:zahir_online_clone/util/colors.dart';
import 'package:zahir_online_clone/screens/login/form_login.dart';
import 'package:zahir_online_clone/styles/text.dart' as textStyles;

class Sales extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sales'),
        backgroundColor: Colors.lightGreen,
      ),
      body: new Container(
        color: Colors.white,
        child: new Center(
          child: new Text('Sales'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/sales_create'),
        child: new Icon(Icons.add),
        backgroundColor: Colors.green[300],
      ),
    );
  }

}