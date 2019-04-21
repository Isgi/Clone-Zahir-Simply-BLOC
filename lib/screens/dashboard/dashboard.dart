import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:zahir_online_clone/util/colors.dart';
import 'package:zahir_online_clone/screens/dashboard/body_sheet.dart' as bodySheet;
import 'package:zahir_online_clone/styles/text.dart';

class Dashboard extends StatefulWidget {

  const Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => new _DashboardState();

}

class _DashboardState extends State<Dashboard> with SingleTickerProviderStateMixin {

  static int _tabIndex;
  int _activeTabIndex;
  PersistentBottomSheetController _controllerTab;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabIndex = 0;
  }

  void handleTabTapped(int index) {
    switch(index) {
      case 0:
        _controllerTab.close();
        break;
      case 1: {
        if(_activeTabIndex != 1) {
          _controllerTab = _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) => bodySheet.dataSheet(context, _controllerTab));
        } else {
          _controllerTab.close();
        }
        break;
      }
      case 2: {
        if(_activeTabIndex != 2) {
          _controllerTab = _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) => bodySheet.addSheet(context, _controllerTab));
        } else {
          _controllerTab.close();
        }
        break;
      }
      case 3:
        if(_activeTabIndex != 3) {
          _controllerTab = _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) => bodySheet.reportSheet(context, _controllerTab));
        }
        break;
      case 4:
        Navigator.pushNamed(context, '/more');
        return;
      default:
        return;
    }

    _activeTabIndex = index;

    //set reactive tabIndex
    setState(() {
      _tabIndex = index;
    });

    //listener closed sheet
    _controllerTab.closed.then((closed) {
      if (_activeTabIndex == index) {
        setState(() {
          _tabIndex = 0;
        });
        _activeTabIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Container(
        decoration: new BoxDecoration(
          gradient: primaryGradient
        ),
        child: new Center(
          child:  new Text(
            'Dashboard',
            style: titleLight,
          ),
        )
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        onTap: handleTabTapped,
        currentIndex: _tabIndex,
        activeColor: Colors.blueAccent,
        iconSize: 27.0,
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: new Text('Dashboard'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(IconData(0xf453, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons')),
            title: new Text('Data'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              _tabIndex == 2 ? CupertinoIcons.clear_circled_solid : CupertinoIcons.add_circled_solid,
              color: Colors.green[300],
              size: 50.0,
            ),
            title: new Text(''),
          ),
          new BottomNavigationBarItem(
            icon: Icon(IconData(0xf471, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons')),
            title: new Text('Report'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(IconData(0xf421, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons')),
            title: new Text('More'),
          ),
        ],
      ),
    );
  }
}
