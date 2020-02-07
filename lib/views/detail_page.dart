import 'package:flutter/material.dart';
import 'package:swiddledick_news/models/Item.dart';

class DetailPage extends StatelessWidget {
  DetailPage({@required this.selectedItem});

  final Item selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  child: Text(
                    '${selectedItem.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${selectedItem.url}',
                      ),
                      Text(
                        'This is where the story will go.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'This is where the comments will go.',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
