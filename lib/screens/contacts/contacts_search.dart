import 'dart:async';

import 'package:flutter/material.dart';

import 'package:zahir_online_clone/decorations/input.dart';
import 'package:zahir_online_clone/styles/text.dart' as textStyles;
import 'package:zahir_online_clone/util/modules.dart';
import 'package:zahir_online_clone/decorations/general_list.dart';

class ContactsSearch extends StatefulWidget {
  @override
  _ContactsSearchState createState() => _ContactsSearchState();
}

class _ContactsSearchState extends State<ContactsSearch> with SingleTickerProviderStateMixin {

  TextEditingController _controller = new TextEditingController();
  Timer debounceTimer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(handleSearch);
  }

  handleSearch() {
    if (debounceTimer != null) {
      debounceTimer.cancel();
    }
    // debounceTimer = Timer(Duration(milliseconds: 500), () {
    //   if (this.mounted) {
    //     _contactsBloc.searchList(contacts, "&search[name]=${_controller.text}");
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralList(
        module: contacts,
        headerTitle: new TextFormField(
          controller: _controller,
          autofocus: true,
          decoration: new Input.notCollapsed(
            hintText: 'Search Contacts...',
            hintColor: Theme.of(context).hintColor,
            contentPadding: EdgeInsets.all(0.0),
            dark: true,
            enableBorder: false
          ),
          style: textStyles.titleDark,
        ),
      ),
    );
  }
}