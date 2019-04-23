import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zahir_online_clone/bloc/contacts_bloc.dart';
import 'package:zahir_online_clone/resources/contacts_data_source.dart';
import 'package:zahir_online_clone/styles/shimmer_list.dart';
import 'package:zahir_online_clone/screens/contacts/contacts_state.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  final _contactsBloc = kiwi.Container().resolve<ContactsBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _contactsBloc.getContacts();
  }

  @override
  void dispose() {
    super.dispose();
    _contactsBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        child: BlocBuilder(
          bloc: _contactsBloc,
          builder: (context, ContactsState state) {
            if (state.results.isEmpty) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[300],
                    highlightColor: Colors.grey[100],
                    child: shimmerList
                ),
              );
            }
            return NotificationListener<ScrollNotification>(
              onNotification: (n) => _handleScrollNotification(state, n),
              child: _buildList(state),
            );
//            return RefreshIndicator(
//              color: Colors.blue,
//              backgroundColor: Colors.white,
//              child: _buildList(state),
//              onRefresh: () {
//                _contactsBloc.getContacts();
//              }
//            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/contacts_create'),
        child: Icon(Icons.add),
        backgroundColor: Colors.green[300],
      ),
    );
  }

  bool _handleScrollNotification(ContactsState state, ScrollNotification notification) {
    if (notification is ScrollEndNotification && _scrollController.position.extentAfter == 0 && state.results.length < state.count) {
      _contactsBloc.loadmoreContacts(state.links.next);
    }
    return false;
  }

}

Widget _buildList(ContactsState snapshot) {
  final contacts = snapshot.results;
  return ListView.builder(
    itemCount: contacts.length,
    itemBuilder: (BuildContext context, int i) {
      return ListTile(
        leading: CircleAvatar(
          child: Text(contacts[i].name[0]),
        ),
        title: Text(contacts[i].name),
        subtitle: Text(contacts[i].code),
      );
    }
  );
}