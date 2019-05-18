import 'package:flutter/material.dart';

import 'package:zahir_online_clone/util/colors.dart';
import 'package:zahir_online_clone/screens/login/form_login.dart';
import 'package:zahir_online_clone/styles/text.dart' as textStyles;

class ContactsCreate extends StatelessWidget {

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
          )
        ],
      )
    );
  }

}