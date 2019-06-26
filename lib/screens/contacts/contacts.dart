import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import 'package:zahir_online_clone/decorations/general_list.dart';
import 'package:zahir_online_clone/util/modules.dart';
import 'package:zahir_online_clone/styles/shimmer_list.dart';
import 'package:zahir_online_clone/bloc/general_list_bloc.dart';
import 'package:zahir_online_clone/states/general_list_state.dart';
import 'package:zahir_online_clone/models/contacts_model.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts>
    with SingleTickerProviderStateMixin {
  final _generalListBloc = kiwi.Container().resolve<GeneralListBloc>();
  final _scrollController = ScrollController();
  List<Results> selectedContacts = List();
  bool _isVisibleBottomBar = true;

  @override
  void initState() {
    _generalListBloc.getList(contacts);
    super.initState();
    _isVisibleBottomBar = true;
  }

  @override
  void dispose() {
    _generalListBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Hero(
        tag: contacts.name,
        child: GeneralList(
            module: contacts,
            bloc: _generalListBloc,
            handleScrollNotification: _handleScrollNotification,
            handleRefresh: _handleRefresh,
            handleSelect: _handleSelect,
            selections: selectedContacts,
            scrollController: _scrollController),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        height: _isVisibleBottomBar ? 50.0 : 0.0,
        child: BottomAppBar(
          elevation: 5.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: selectedContacts.length > 0
                  ? <Widget>[
                      Container(
                        width: 45.0,
                        child: Center(
                            child: Text(
                          selectedContacts.length.toString(),
                          style: TextStyle(
                              color: Colors.blueAccent, fontSize: 16.0),
                        )),
                      ),
                      Container(
                        width: 45.0,
                      ),
                      Container(
                        width: 45.0,
                      ),
                      Container(
                        width: 45.0,
                        child: selectedContacts.length > 1
                            ? null
                            : IconButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, '/contacts_search'),
                                icon:
                                    Icon(Icons.edit, color: Colors.blueAccent)),
                      ),
                      IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/contacts_search'),
                          icon: Icon(Icons.delete_outline,
                              color: Colors.blueAccent)),
                    ]
                  : <Widget>[
                      IconButton(
                          onPressed: () => {}, icon: Icon(Icons.filter_list)),
                      IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/contacts_search'),
                          icon: Icon(Icons.search)),
                      Container(
                        width: 45.0,
                      ),
                      Container(
                        width: 45.0,
                      ),
                      Container(
                        width: 45.0,
                      ),
                    ],
            ),
          ),
        ),
      ),
      
      floatingActionButton: selectedContacts.length > 0
          ? null
          : Container(
             padding: EdgeInsets.all(5.0),
             child: FloatingActionButton(
              onPressed: () => {},
              child: Icon(Icons.add),
              backgroundColor: Colors.green[300],
            )
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Future<Null> _handleRefresh() async {
    final Completer<Null> completer = new Completer<Null>();
    await _generalListBloc.getList(contacts);
    completer.complete();
    return completer.future;
  }

  bool _handleScrollNotification(
    GeneralListState state, ScrollUpdateNotification notification) {
    if (_scrollController.position.extentAfter == 0 &&
        state.results.length < state.count) {
      _generalListBloc.loadmoreList(contacts, state.links.next);
    }
    if (notification.scrollDelta > 0 && _isVisibleBottomBar == true) {
      setState(() {
        _isVisibleBottomBar = false;
      });
    }
    if (notification.scrollDelta < 0 && _isVisibleBottomBar == false) {
      setState(() {
        _isVisibleBottomBar = true;
      });
    }

    return false;
  }

  _handleSelect(Results item) {
    setState(() {
      selectedContacts.contains(item)
          ? selectedContacts.remove(item)
          : selectedContacts.add(item);
    });
  }
}
