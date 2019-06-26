import 'dart:async';
import 'dart:math' as math;
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zahir_online_clone/states/general_list_state.dart';
import 'package:zahir_online_clone/bloc/general_list_bloc.dart';
import 'package:zahir_online_clone/styles/shimmer_list.dart';
import 'package:zahir_online_clone/util/modules.dart';

class GeneralList extends StatelessWidget {

  GeneralList({
    @required this.module,
    @required this.handleScrollNotification,
    @required this.scrollController,
    @required this.handleRefresh,
    this.handleSelect,
    this.selections,
    this.headerTitle,
    this.bloc
  });

  final Module module;
  final Widget headerTitle;
  final bloc;
  final handleScrollNotification;
  final scrollController;
  final handleRefresh;
  final handleSelect;
  final List selections;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, GeneralListState state) {
          return NotificationListener<ScrollUpdateNotification>(
            onNotification: (n) => handleScrollNotification(state, n),
            child: RefreshIndicator(
              child: CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverAppBar(
                      iconTheme: IconThemeData(
                        color: Colors.black87,
                      ),
                      backgroundColor: Theme.of(context).canvasColor,
                      expandedHeight: 100.0,
                      floating: false,
                      pinned:  this.headerTitle != null || selections.length > 0,
                      flexibleSpace: FlexibleSpaceBar(
                        title: this.headerTitle != null ? this.headerTitle : Text(module.title, style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                    SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      final contacts = state.results;
                      if (state.getPending != null && state.getPending == true) {
                        return Container(
                          margin: EdgeInsets.only(top: 10.0),
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
                        return Container();
                      }
                      return ListTile(
                        onLongPress: () => handleSelect(contacts[index]),
                        onTap: () => selections.length > 0 ? handleSelect(contacts[index]) : null,
                        leading: CircleAvatar(
                          backgroundColor: selections.contains(contacts[index]) ? Colors.blue[600] : Color((contacts[index].name[0].hashCode * 0xFFFFFF).toInt() << 0).withOpacity(1.0),
                          child: selections.contains(contacts[index]) 
                            ? Icon(Icons.check, color: Colors.white)
                            : Text(contacts[index].name[0]),
                        ),
                        title: Text(contacts[index].name),
                        subtitle: Text(contacts[index].code),
                      );
                    }, childCount: state.results.length + 2))
                  ]
              ),
              onRefresh: () {
                return handleRefresh();
              },
            )
          );
        }
      ),
    );
  }
}