import 'package:flutter/material.dart';
import 'package:zahir_online_clone/injection_container.dart';
import 'package:zahir_online_clone/routes.dart';

void main() {
//  MaterialPageRoute.debugEnableFadingRoutes = true;
  initKiwi();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ZahirX',
      initialRoute: '/',
      routes: routes,
      theme: new ThemeData(
        canvasColor: Colors.transparent,
      ),
    );
  }
}
