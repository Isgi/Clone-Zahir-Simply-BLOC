import 'package:flutter/material.dart';

import 'package:zahir_online_clone/util/colors.dart';
import 'package:zahir_online_clone/screens/login/form_login.dart';
import 'package:zahir_online_clone/styles/text.dart' as textStyles;

class PayablePaymentCreate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Payable Payment Create'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: new Container(
        color: Colors.white,
        child: new Center(
          child: new Text('Payable Payment Create'),
        ),
      )
    );
  }

}