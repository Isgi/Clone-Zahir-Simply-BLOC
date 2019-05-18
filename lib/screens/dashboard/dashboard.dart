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
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    _tabIndex = 0;
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200)
    );
    animation = Tween(begin: 50.0, end: 0.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  void handleTabTapped(int index) {
    switch(index) {
      case 0:
        _controllerTab.close();
        break;
      case 1: {
        if(_activeTabIndex != 1) {
          animationController.forward();
          _controllerTab = _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) => bodySheet.dataSheet(context, _controllerTab));
        } else {
          _controllerTab.close();
        }
        break;
      }
      case 2: {
        if(_activeTabIndex != 2) {
          animationController.forward();
          _controllerTab = _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) => bodySheet.addSheet(context, _controllerTab));
        } else {
          _controllerTab.close();
        }
        break;
      }
      case 3:
        if(_activeTabIndex != 3) {
          animationController.forward();
          _controllerTab = _scaffoldKey.currentState.showBottomSheet<Null>((BuildContext context) => bodySheet.reportSheet(context, _controllerTab));
        }
        break;
      case 4:
        Navigator.pushNamed(context, '/more');
        return;
      default:
        animationController.reverse();
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
        animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: new Container(
        child: new Center(
          child:  new Text(
            'Dashboard',
            style: titleLight,
          ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 5.0,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: animation.value != null ? animation.value : 0.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(onPressed: () => handleTabTapped(0), icon: Icon(CupertinoIcons.home)),
                IconButton(onPressed: () => handleTabTapped(1), icon: Icon(IconData(0xf453, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'))),
                Container(width: 45.0,),
                IconButton(onPressed: () => handleTabTapped(3), icon: Icon(IconData(0xf471, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'))),
                IconButton(onPressed: () => handleTabTapped(4), icon: Icon(IconData(0xf421, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'))),
              ],
            ),
          )
      ),
      floatingActionButton: Container(
          height: animation.value,
          width: animation.value,
          child: FloatingActionButton(
            onPressed: () => handleTabTapped(2),
            child: Icon(Icons.add, size: animation.value / 2),
            backgroundColor: Colors.green[300],
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
