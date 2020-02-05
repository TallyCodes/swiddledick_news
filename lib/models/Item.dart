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

  Item({this.id, this.by, this.descendants, this.kids, this.score, this.time,
    this.title, this.type, this.url});

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
      url: json['url']
    );
  }
}