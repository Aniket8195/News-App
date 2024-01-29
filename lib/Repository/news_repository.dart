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
        'X-Rapidapi-Key': '9532e26c97mshea972d915b9af3fp1b9ea8jsnc4978c8f43ca',
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