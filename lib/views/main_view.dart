import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swiddledick_news/models/Item.dart';
import 'package:swiddledick_news/services/api.dart';

import 'package:swiddledick_news/views/detail_page.dart';
import 'package:swiddledick_news/widgets/shimmer.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swiddledick News'),
      ),
      body: FutureBuilder(
        future: _getTopPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Item> items = snapshot.data as List<Item>;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
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
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    selectedItem: items[index],
                                  )),
                        );
                      },
                    ),
                  );
                },
              ),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return ShimmerLoading(timer: 1000);
                },
              ),
            );
          }
        },
      ),
    );
  }

  Future<List<Item>> _getTopPosts() async {
    var response = await Api.getTopStories();
    var storiesDecoded = await json.decode(response.body);
    var storiesListed = List<int>.from(storiesDecoded.take(30));
    return Api.getItemList(storiesListed);
  }
}
