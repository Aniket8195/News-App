import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Models/news.dart';

class NewsRepository {

  final String apiUrl = 'https://newsnow.p.rapidapi.com';

  Future<List<News>> fetchNews() async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'X-Rapidapi-Key': '2a20ff6001msh38a25e59dbad2b8p1988bdjsn7bd4860d3c8e',
        'X-Rapidapi-Host': 'newsnow.p.rapidapi.com',
        'Host': 'newsnow.p.rapidapi.com',
      },
      body: jsonEncode({
        "text": "India",
        "region": "wt-wt",
        "max_results": 100,
      }),
    );

    if (response.statusCode == 200) {
      final dynamic decodedResponse = jsonDecode(response.body);
      if (decodedResponse['news'] != null) {
        List<dynamic> newsData = decodedResponse['news'];
        List<News> newsList = newsData
            .where((news) =>
        news['title'] != null && news['body'] != null && news['image'] != null)
            .map((news) => News.fromJson(news))
            .toList();
        //print(newsList);
        return newsList;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Failed to load news');
    }
  }
}