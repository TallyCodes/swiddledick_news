import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:swiddledick_news/models/Item.dart';

class Api {
  static const baseUrl = 'hacker-news.firebaseio.com';

  static Future<dynamic> getTopStories() {
    var url = Uri.https(baseUrl, '/v0/topstories.json');
    return http.get(url);
  }

  static Future<List<Item>> getItemList(List<int> ids) {
    return Future.wait<Item>(ids.map((id) => getItem(id)));
  }

  static Future<Item> getItem(int id) async {
    var url = Uri.https(baseUrl, '/v0/item/${id.toString()}.json');
    print('$url');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load Item');
    }
  }
}
