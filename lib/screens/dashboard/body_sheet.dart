import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:zahir_online_clone/styles/text.dart';
import 'package:zahir_online_clone/util/modules.dart';

class Item {
  Module module;
  IconData icon;
  Color tintColor;
  String routeName;

  Item(Module module, IconData icon, Color tintColor, [String routeName] ) {
    this.module = module;
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
//        controllerTab.close();
        Navigator.pushNamed(context, items[i].routeName);
      },
      child: new Hero(
        tag: items[i].module.name,
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(items[i].icon, size: 45.0, color: items[i].tintColor),
                Material(
                  color: Colors.transparent,
                  child: Text(items[i].module.title, textAlign: TextAlign.center, style: labelDark),
                ),
              ],
            ),
          ),
        )),
      )
    );
  }
  return tiles;
}

dataSheet(BuildContext context, PersistentBottomSheetController controllerTab) => new Container(
  padding: EdgeInsets.all(10.0),
  child: new Card(
    elevation: 0.1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Container(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      decoration: new BoxDecoration(
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
              new Item(contacts, IconData(0xf419, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.blue, '/contacts'),
              new Item(products, IconData(0xf3eb, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.red, '/products'),
              new Item(sales, IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/sales'),
              new Item(purchases, IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/purchase'),
              new Item(receivable_payments, IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/receivable_payment'),
              new Item(payable_payments, IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/payable_payment'),
              new Item(expenses, IconData(0xf3d7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.red, '/expense'),
            ]),
          ),
        ],
      ),
    ),
  )
);

addSheet(BuildContext context, PersistentBottomSheetController controllerTab) => new Container(
  color: Colors.grey[100],
  padding: EdgeInsets.all(10.0),
  child: new Card(
    elevation: 0.1,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Container(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      decoration: new BoxDecoration(
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
              new Item(sales, IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/sales_create'),
              new Item(purchases, IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/purchase_create'),
              new Item(receivable_payments, IconData(0xf41b, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/receivable_payment_create'),
              new Item(payable_payments, IconData(0xf3f7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.purpleAccent, '/payable_payment_create'),
              new Item(expenses, IconData(0xf3d7, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.red, '/expense_create'),
            ]),
          ),
        ],
      ),
    ),
  ),
);

reportSheet(BuildContext context, PersistentBottomSheetController controllerTab) => new Container(
  color: Colors.grey[100],
  padding: EdgeInsets.all(10.0),
  child: new Card(
    elevation: 0.1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
    child: Container(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      decoration: new BoxDecoration(
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
              new Item(profit_loss, IconData(0xf493, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'), Colors.lightGreen, '/profit_loss')
            ]),
          ),
        ],
      ),
    ),
  ),
);