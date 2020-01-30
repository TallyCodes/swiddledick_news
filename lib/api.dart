import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/Item.dart';

const baseUrl = "https://hacker-news.firebaseio.com/v0";

class Api {
  static Future<List<Item>> getTopStories() async {
    var url = baseUrl + "/topstories.json";
    final response = await http.get(url);
    Iterable list = json.decode(response.body);
    var items = await getItemList(new List<int>.from(list.take(30)));
    return items;
  }

  static Future<List<Item>> getItemList(List<int> ids) {
    return Future.wait<Item>(ids.map((id) => getItem(id)));
  }

  static Future<Item> getItem(int id) async {
    var url = baseUrl + "/item/" + id.toString() + ".json";

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return Item.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Item");
    }
  }
}