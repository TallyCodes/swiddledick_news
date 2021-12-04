class Item {
  final int id;
  final String by;
  final int descendants;
  final List<dynamic> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  int getHoursSincePosted() {
    DateTime postDate = new DateTime.fromMillisecondsSinceEpoch(time * 1000);
    return DateTime.now().difference(postDate).inHours;
  }

  Item({
    required this.id,
    required this.by,
    required this.descendants,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        id: json['id'],
        by: json['by'],
        descendants: json['descendants'],
        kids: json['kids'],
        score: json['score'],
        time: json['time'],
        title: json['title'],
        type: json['type'],
        url: json['url']);
  }
}
