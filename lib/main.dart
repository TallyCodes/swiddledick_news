import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'API.dart';

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
      body: SafeArea(
              child: Container(
          child: BuildListItems(),
        ),
      ),
    );
  }
}

class BuildListItems extends StatefulWidget { 
  @override
  _BuildListItems createState() => _BuildListItems();
}

class _BuildListItems extends State<BuildListItems> {
  var topStoryIds = new List<int>();

  _getTopPosts() {
    Api.getTopStories().then((response) {
        setState(() {
          Iterable list = json.decode(response.body);
          topStoryIds = new List<int>.from(list);
        });
    });
  }

  @override
  void initState() {
    super.initState();
    _getTopPosts();
  }

  @override
  Widget build(BuildContext context) { 
    return _myListView(context);
  }

  Widget _myListView(BuildContext context) {

      final titles = ['bike', 'boat', 'bus', 'car',
      'railway', 'run', 'subway', 'transit', 'walk'];

      final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

      return ListView.builder(
        itemCount: topStoryIds.length,
        itemBuilder: (context, index) {
          return Card( 
            child: ListTile(
              //leading: Icon(icons[index]),
              title: Text(topStoryIds[index].toString()),
              onTap: () {
                print(topStoryIds[index]);
              },
            ),
          );
        },
      );
    }
}
