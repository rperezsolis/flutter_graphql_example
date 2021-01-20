import 'package:flutter/material.dart';
import 'package:graphql_example/pages/launches.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graphql Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Launches(title: 'SpaceX Launches',),
    );
  }
}