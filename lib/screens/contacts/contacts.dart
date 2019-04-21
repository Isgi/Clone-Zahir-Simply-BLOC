import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

import 'package:zahir_online_clone/models/contacts_model.dart';
import 'package:zahir_online_clone/bloc/contacts_bloc.dart';
import 'package:zahir_online_clone/styles/shimmer_list.dart';
import 'package:zahir_online_clone/screens/contacts/contacts_state.dart';
import 'package:zahir_online_clone/resources/contacts_provider.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  final _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const offsetVisibleThreshold = 50;

  ContactsBloc _bloc;
  StreamSubscription<void> _subscriptionReachMaxItems;
  StreamSubscription<Object> _subscriptionError;

  @override
  void initState() {
    super.initState();
    _bloc = ContactsBloc(ContactsProvider());
    // listen error, reach max items
    _subscriptionReachMaxItems = _bloc.loadedAllContacts.listen(_onReachMaxItem);
    _subscriptionError = _bloc.error.listen(_onError);
    // add listener to scroll controller
    _scrollController.addListener(_onScroll);
    // load first page
    _bloc.loadFirstPage.add(null);
  }

  @override
  void dispose() {
    _scrollController.dispose();

    _subscriptionError.cancel();
    _subscriptionReachMaxItems.cancel();
    _bloc.dispose();

    super.dispose();
  }

  Future<void> makeAnimation() async {
    final offsetFromBottom =
        _scrollController.position.maxScrollExtent - _scrollController.offset;
    if (offsetFromBottom < offsetVisibleThreshold) {
      await _scrollController.animateTo(
        _scrollController.offset - (offsetVisibleThreshold - offsetFromBottom),
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeOut,
      );
    }
  }

  void _onReachMaxItem(void _) async {
    // show animation when loaded all data
    await makeAnimation();
    await (_scaffoldKey.currentState
        ?.showSnackBar(
      SnackBar(
        content: Text('Got all data!'),
      ),
    )
        ?.closed);
  }

  void _onError(Object error) async {
    await (_scaffoldKey.currentState
        ?.showSnackBar(
      SnackBar(
        content: Text('Error occurred: $error'),
      ),
    )
        ?.closed);
  }

  void _onScroll() {
    // if scroll to bottom of list, then load next page
    if (_scrollController.offset + offsetVisibleThreshold >=
        _scrollController.position.maxScrollExtent) {
      print('_bloc.loadMore.add(null)');
      _bloc.loadMore.add(null);
    }
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
        child: StreamBuilder<ContactsState>(
          stream: _bloc.contacts,
          builder: (context, AsyncSnapshot<ContactsState> snapshot) {
//            print(snapshot.data.isPending);
            if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData) {
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
            return RefreshIndicator(
              color: Colors.blue,
              backgroundColor: Colors.white,
              child: _buildList(snapshot),
              onRefresh: () {
                _bloc.loadFirstPage.add(null);
              }
            );
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

}

Widget _buildList(AsyncSnapshot<ContactsState> snapshot) {
  final contacts = snapshot.data.contacts;
  final isLoading = snapshot.data.isLoading;
  final error = snapshot.data.error;

  return ListView.builder(
    itemCount: contacts.results.length,
    itemBuilder: (BuildContext context, int i) {
      return ListTile(
        leading: CircleAvatar(
          child: Text(contacts.results[i].name[0]),
        ),
        title: Text(contacts.results[i].name),
        subtitle: Text(contacts.results[i].code),
      );
    }
  );
}