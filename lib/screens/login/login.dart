import 'package:flutter/material.dart';

import 'package:zahir_online_clone/util/colors.dart';
import 'package:zahir_online_clone/screens/login/form_login.dart';
import 'package:zahir_online_clone/styles/text.dart' as textStyles;

class Login extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        decoration: new BoxDecoration(
          gradient: primaryGradient
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(IconData(0xf444, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), size: 100.0, color: Colors.white),
              new Padding(
                padding: new EdgeInsets.only(bottom: 10.0),
                child: new Text(
                  'Welcome to Zahir X',
                  style: textStyles.titleLight
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(bottom: 30.0),
                child: new Text(
                  'You can simply use ZahirID to sign in',
                  style: textStyles.subtitleLight
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(bottom: 20.0),
                child: new FormLogin()
              ),
            ],
          ),
        ),
      ),
    );
  }

}