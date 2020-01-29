import 'package:flutter/material.dart';

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

class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: MainListView(),
      ),
    );
  }
}

class MainListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("This is where the text will go"),
        ),
        ListTile(
          title: Text("Another entry here"),
        )
      ],
    );
  }
}
