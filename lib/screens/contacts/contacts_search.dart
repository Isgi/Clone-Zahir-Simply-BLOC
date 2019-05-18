import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zahir_online_clone/bloc/general_list_bloc.dart';
import 'package:zahir_online_clone/decorations/input.dart';
import 'package:zahir_online_clone/styles/shimmer_list.dart';
import 'package:zahir_online_clone/states/general_list_state.dart';
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

  final _contactsBloc = kiwi.Container().resolve<GeneralListBloc>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(handleSearch);
  }

  @override
  void dispose() {
    super.dispose();
    _contactsBloc.dispose();
  }

  handleSearch() {
    if (debounceTimer != null) {
      debounceTimer.cancel();
    }
    debounceTimer = Timer(Duration(milliseconds: 500), () {
      if (this.mounted) {
        _contactsBloc.searchList(contacts, "&search[name]=${_controller.text}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GeneralList(
      module: contacts,
      hideBottomBar: true,
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
    );
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder(
            bloc: _contactsBloc,
            builder: (context, GeneralListState state) {
              return NotificationListener<ScrollUpdateNotification>(
                  onNotification: (n) => _handleScrollNotification(state, n),
                  child: RefreshIndicator(
                    child: CustomScrollView(
                        controller: _scrollController,
                        slivers: <Widget>[
                          SliverAppBar(
                            backgroundColor: Theme.of(context).canvasColor,
                            expandedHeight: 100.0,
                            floating: false,
                            pinned: true,
                            flexibleSpace: FlexibleSpaceBar(
                              title: new TextFormField(
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
//                              centerTitle: true,
                            ),
                          ),
                          SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                            final contacts = state.results;
                            if (state.searchPending != null && state.searchPending == true) {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                                child: Shimmer.fromColors(
                                    baseColor: Theme.of(context).splashColor,
                                    highlightColor: Theme.of(context).hintColor,
                                    child: shimmerList
                                ),
                              );
                            }
                            if (index >= contacts.length) {
                              if (state.loadmorePending != null && state.loadmorePending == true) {
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                                  child: Shimmer.fromColors(
                                      baseColor: Theme.of(context).splashColor,
                                      highlightColor: Theme.of(context).hintColor,
                                      child: shimmerList
                                  ),
                                );
                              }
                              return ListTile();
                            }
                            return ListTile(
                              leading: CircleAvatar(
                                child: Text(contacts[index].name[0]),
                              ),
                              title: Text(contacts[index].name),
                              subtitle: Text(contacts[index].code),
                            );
                          }, childCount: state.results.length + 2))
                        ]
                    ),
                    onRefresh: () {
                      return _onRefresh();
                    },
                  )
              );
            }
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    final Completer<Null> completer = new Completer<Null>();
    await _contactsBloc.searchList(contacts, "&search[name]=${_controller.text}");
    completer.complete();
    return completer.future;
  }

  bool _handleScrollNotification(GeneralListState state, ScrollUpdateNotification notification) {
    if (_scrollController.position.extentAfter == 0 && state.results.length < state.count) {
      _contactsBloc.loadmoreList(contacts, state.links.next);
    }
    return false;
  }

}