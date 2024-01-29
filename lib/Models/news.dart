class News{
  final DateTime date;
  final String title;
  final String body;
  final String url;
  final String image;
  final String source;

  News({
    required this.date,
    required this.title,
    required this.body,
    required this.url,
    required this.image,
    required this.source,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      date: DateTime.parse(json['date']),
      title: json['title'],
      body: json['body'],
      url: json['url'],
      image: json['image'],
      source: json['source'],
    );
  }

}