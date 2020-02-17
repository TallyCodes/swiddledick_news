import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:swiddledick_news/services/api.dart';
import 'package:swiddledick_news/models/Item.dart';
import 'package:swiddledick_news/views/detail_page.dart';


class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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

  //TODO: I would like to make this a method to be able to reload the table on either a button or pull down to reload option.
  _getTopPosts() {
    Api.getTopStories()
      .then((response) => json.decode(response.body))
      .then((decoded) => List<int>.from(decoded.take(30)))
      .then((list) => Api.getItemList(list))
      .then((itemList) {
        setState(() {
            items = itemList; 
        });
      }).catchError((error) => print(error));
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
              title: Text(items[index].title),
              subtitle: Text('${items[index].by}  ${items[index].getHoursSincePosted()} hrs'),
              trailing: Column(children: <Widget>[
                Icon(Icons.comment),
                Text('${items[index].descendants}'),
              ]), 
              onTap: () {
                print(items[index].id);
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => DetailPage(
                    selectedItem: items[index],
                  )),
                  );
              },
            ),
          );
        },
      );
    }
}
