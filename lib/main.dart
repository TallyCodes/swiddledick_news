import 'package:flutter/material.dart';
import 'package:swiddledick_news/views/main_page.dart';


void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) { 
    return MaterialApp(
      title: 'Swiddledick News',
      theme: ThemeData(
        primarySwatch: Colors.green,
        ),
      home: MainScaffold(),
    );
  }
}

