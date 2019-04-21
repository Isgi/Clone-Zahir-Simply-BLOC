import 'package:flutter/material.dart';
import 'dart:async';

import 'package:zahir_online_clone/util/colors.dart';
import 'package:zahir_online_clone/styles/text.dart';

class Landing extends StatelessWidget {

  checkIfAuthenticated() async {
    await Future.delayed(Duration(seconds: 1));  // could be a long running task, like a fetch from keychain
    return false;
  }

  @override
  Widget build(BuildContext context) {
    checkIfAuthenticated().then((success) {
      if (success) {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
    return new Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            gradient: primaryGradient
        ),
        child: new Center(
          child: new Text('ZAHIR X', style: titleLight),
        ),
      ),
    );
  }

}