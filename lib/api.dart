import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://hacker-news.firebaseio.com/v0";

class Api {
  static Future getTopStories() {
    var url = baseUrl + "/topstories.json";
    return http.get(url);
  }
}