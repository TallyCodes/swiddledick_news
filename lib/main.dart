import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';

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

class BuildListItems extends StatefulWidget { 
  @override
  _BuildListItems createState() { 
    return _BuildListItems();
  }
}

class _BuildListItems extends State<BuildListItems> {
  Widget build(BuildContext context, Map data) { 

    final newsEntry = Entry.fromMap(data);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: ListTile(

        ),
      ),
    );
  }
}
