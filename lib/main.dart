import 'package:custom_appbar/pages/tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'core/values.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: primarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabsPage(),
    );
  }
}
