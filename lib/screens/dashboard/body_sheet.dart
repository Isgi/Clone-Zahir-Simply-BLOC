import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:zahir_online_clone/styles/text.dart';

class Item {
  String label;
  IconData icon;
  Color tintColor;
  String routeName;

  Item(String label, IconData icon, Color tintColor, [String routeName] ) {
    this.label = label;
    this.icon = icon;
    this.tintColor = tintColor;
    this.routeName = routeName;
  }

}

List<Widget> _buildItems(BuildContext context, PersistentBottomSheetController controllerTab, List<Item> items) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < items.length ; i++) {
    tiles.add(new InkWell(
      onTap: (){
        controllerTab.close();
        Navigator.pushNamed(context, items[i].routeName);
      },
      child: new Card(
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(items[i].icon, size: 45.0, color: items[i].tintColor,),
              Text(items[i].label, textAlign: TextAlign.center, style: labelDark)
            ],
          ),
        ),
      )),
    );
  }
  return tiles;
}

dataSheet(BuildContext context, PersistentBottomSheetController controllerTab) => new Container(
  color: Colors.transparent,
  padding: EdgeInsets.all(10.0),
  child: new Container(
    padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
    decoration: new BoxDecoration(
      color: Colors.grey[100],
        borderRadius: new BorderRadius.all(Radius.circular(10.0))
    ),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Center(child: new Icon(Icons.drag_handle, textDirection: TextDirection.rtl)),
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: new Text('Data', textAlign: TextAlign.left, style: subtitleDark),
        ),
        new GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 3,
          children: _buildItems(context, controllerTab, [
            new Item('Contact', IconData(0xf419, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.blue, '/contacts'),
            new Item('Product', IconData(0xf3eb, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.red, '/products'),
            new Item('Sales', IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/sales'),
            new Item('Purchase', IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/purchase'),
            new Item('Receivable Payment', IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/receivable_payment'),
            new Item('Payable Payment', IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/payable_payment'),
            new Item('Expense', IconData(0xf3d7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.red, '/expense'),
          ]),
        ),
      ],
    ),
  ),
);

addSheet(BuildContext context, PersistentBottomSheetController controllerTab) => new Container(
  color: Colors.transparent,
  padding: EdgeInsets.all(10.0),
  child: new Container(
    padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
    decoration: new BoxDecoration(
        color: Colors.grey[100],
        borderRadius: new BorderRadius.all(Radius.circular(10.0))
    ),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Center(child: new Icon(Icons.drag_handle, textDirection: TextDirection.rtl)),
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: new Text('Add', textAlign: TextAlign.left, style: subtitleDark),
        ),
        new GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 3,
          children: _buildItems(context, controllerTab, [
            new Item('Sales', IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/sales_create'),
            new Item('Purchase', IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/purchase_create'),
            new Item('Receivable Payment', IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/receivable_payment_create'),
            new Item('Payable Payment', IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/payable_payment_create'),
            new Item('Expense', IconData(0xf3d7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.red, '/expense_create'),
          ]),
        ),
      ],
    ),
  ),
);

reportSheet(BuildContext context, PersistentBottomSheetController controllerTab) => new Container(
  color: Colors.transparent,
  padding: EdgeInsets.all(10.0),
  child: new Container(
    padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
    decoration: new BoxDecoration(
      color: Colors.grey[100],
      borderRadius: new BorderRadius.all(Radius.circular(10.0))
    ),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Center(child: new Icon(Icons.drag_handle, textDirection: TextDirection.rtl)),
        new Padding(
          padding: EdgeInsets.all(10.0),
          child: new Text('Report', textAlign: TextAlign.left, style: subtitleDark),
        ),
        new GridView.count(
          shrinkWrap: true,
          primary: false,
          crossAxisCount: 3,
          children: _buildItems(context, controllerTab, [
            new Item('Profit & Loss', IconData(0xf493, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/profit_loss')
          ]),
        ),
      ],
    ),
  ),
);