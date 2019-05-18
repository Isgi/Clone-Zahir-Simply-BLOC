import 'package:flutter/material.dart';

import 'package:zahir_online_clone/util/validator.dart';
import 'package:zahir_online_clone/decorations/input.dart';
import 'package:zahir_online_clone/styles/text.dart' as textStyles;
class FormLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _FormLoginState();
  }
}

class _DataLogin {
  String email = '';
  String password = '';
}

class _FormLoginState extends State<FormLogin> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  _DataLogin _data = new _DataLogin();

  void handleSubmit() {
//    if (this._formKey.currentState.validate()) {
//      _formKey.currentState.save(); // Save our form now.
//
//      print('Printing the login data.');
//      print('Email: ${_data.email}');
//      print('Password: ${_data.password}');
//    }
    Navigator.pushNamed(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: this._formKey,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: validateEmail,
              decoration: new Input.notCollapsed(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email)
              ),
              style: textStyles.subtitleLight,
              onSaved: (String value) {
                this._data.email = value;
              },
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: new TextFormField(
              obscureText: true,
              validator: validatePassword,
              decoration: new Input.notCollapsed(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock)
              ),
              style: textStyles.subtitleLight,
              onSaved: (String value) {
                this._data.password = value;
              },
            ),
          ),
          new Container(
            alignment: Alignment.centerRight,
            child: new FlatButton(
              onPressed: () => print('test'),
              child: new Text(
                'Forgot Password?',
                style: textStyles.subtitleLight,
              ),
            ),
          ),
          new SizedBox(
            width: double.infinity,
            child: new RaisedButton(
              color: Colors.green[300],
              child: new Text(
                'Sign In',
                style: textStyles.subtitleLightBold,
              ),
              onPressed: this.handleSubmit
            ),
          ),
          new FlatButton(
            onPressed: () => print('test'),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Don't have account? ",
                  style: textStyles.subtitleLight,
                ),
                new Text(
                  ' Sign Up',
                  style: textStyles.subtitleLightBold,
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}