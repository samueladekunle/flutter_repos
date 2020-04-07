import 'package:flutter/material.dart';
import 'package:flutter_repos/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Repos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        ReposScreen.routeName: (BuildContext context) => ReposScreen(),
      },
    );
  }
}