import 'package:flutter/material.dart';

import 'api.dart';
import 'models/Item.dart';
import './detail_page.dart';

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
  List<Item> items = new List<Item>();

  _getTopPosts() {
    Api.getTopStories()
      .then((response) {
        setState(() {
            items = response; 
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
      return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card( 
            child: ListTile(
              leading: Text(items[index].score.toString()),
              title: Text(items[index].title),
              subtitle: Text("By: " + items[index].by),
              onTap: () {
                print(items[index].id);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DetailPage()),
                  );
              },
            ),
          );
        },
      );
    }
}
