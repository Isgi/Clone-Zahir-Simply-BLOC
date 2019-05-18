import 'dart:async';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zahir_online_clone/states/general_list_state.dart';
import 'package:zahir_online_clone/bloc/general_list_bloc.dart';
import 'package:zahir_online_clone/styles/shimmer_list.dart';
import 'package:zahir_online_clone/util/modules.dart';

class GeneralList extends StatefulWidget {

  GeneralList({
    @required this.module,
    this.hideBottomBar,
    this.headerTitle
  });

  final Module module;
  final Widget headerTitle;
  final bool hideBottomBar;

  @override
  _GeneralListState createState() => _GeneralListState(
    module: this.module,
    headerTitle: this.headerTitle,
    hideBottomBar: this.hideBottomBar
  );
}


class _GeneralListState extends State<GeneralList> with SingleTickerProviderStateMixin  {

  Animation animation;
  AnimationController animationController;

  final _generalListBloc = kiwi.Container().resolve<GeneralListBloc>();
  final _scrollController = ScrollController();

  _GeneralListState({
    @required this.module,
    this.headerTitle,
    this.hideBottomBar,
  });
  
  final Module module;
  final Widget headerTitle;
  final bool hideBottomBar;

  @override
  void initState() {
    super.initState();
    _generalListBloc.getList(module);
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400)
    );
    animation = Tween(begin: 50.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _generalListBloc.dispose();
  }
  
  handleClickSearch() {
    animationController.forward();
    _scrollController.position.moveTo(0.0, duration: Duration(milliseconds: 200), curve: null, clamp: true);
    Future.delayed(Duration(milliseconds: 200), () => Navigator.pushNamed(context, '/contacts_search'));
    Future.delayed(Duration(milliseconds: 400), () => animationController.reverse());
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Hero (
        tag: module.name,
        child: SafeArea(
          child: BlocBuilder(
              bloc: _generalListBloc,
              builder: (context, GeneralListState state) {
                return NotificationListener<ScrollUpdateNotification>(
                    onNotification: (n) => _handleScrollNotification(state, n),
                    child: RefreshIndicator(
                      child: CustomScrollView(
                          controller: _scrollController,
                          slivers: <Widget>[
                            SliverAppBar(
                              iconTheme: IconThemeData(
                                color: Colors.black87,
                              ),
                              backgroundColor: Theme.of(context).canvasColor,
                              expandedHeight: 100.0,
                              floating: false,
                              pinned: false,
                              flexibleSpace: FlexibleSpaceBar(
                                title: this.headerTitle != null ? this.headerTitle : Text(module.title, style: TextStyle(color: Colors.black87)),
                              ),
                            ),
                            SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                              final contacts = state.results;
                              if (state.getPending != null && state.getPending == true) {
                                return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Shimmer.fromColors(
                                      baseColor: Theme.of(context).splashColor,
                                      highlightColor: Theme.of(context).splashColor,
                                      child: shimmerList
                                  ),
                                );
                              }
                              if (index >= contacts.length) {
                                if (state.loadmorePending != null && state.loadmorePending == true) {
                                  return Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Shimmer.fromColors(
                                        baseColor: Theme.of(context).splashColor,
                                        highlightColor: Theme.of(context).splashColor,
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
      ),
      bottomNavigationBar: this.hideBottomBar != null && this.hideBottomBar == true
        ? null
        : BottomAppBar(
          elevation: 0.0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: animation.value != null ? animation.value : 0.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(onPressed: () => {}, icon: Icon(IconData(0xf4a7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'))),
                IconButton(onPressed: handleClickSearch, icon: Icon(IconData(0xf4a5, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'))),
                Container(width: 45.0,),
                Container(width: 45.0,),
                Container(width: 45.0,),
              ],
            ),
          )
      ),
      floatingActionButton: this.hideBottomBar != null && this.hideBottomBar == true
        ? null
        : Container(
          height: animation.value,
          width: animation.value,
          child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/contacts_create'),
            child: Icon(Icons.add, size: animation.value / 2),
            backgroundColor: Colors.green[300],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Future<Null> _onRefresh() async {
    final Completer<Null> completer = new Completer<Null>();
    await _generalListBloc.getList(module);
    completer.complete();
    return completer.future;
  }

  bool _handleScrollNotification(GeneralListState state, ScrollUpdateNotification notification) {
    if (_scrollController.position.extentAfter == 0 && state.results.length < state.count) {
      _generalListBloc.loadmoreList(module, state.links.next);
    }
    if ((notification.scrollDelta > 0) && (animation.isDismissed)) {
      animationController.forward();
    } else if ((notification.scrollDelta < 0) &&
        (animation.isCompleted)) {
      animationController.reverse();
    }
    return false;
  }
}