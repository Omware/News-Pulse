import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/article.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:newsapp/utils/config.dart';

class NewsApiProvider {
  var client = http.Client();

  Future<ConnectivityResult> _checkConnectivity() async {
    return await (Connectivity().checkConnectivity());
  }

  Future<void> closeClient() async {
    client.close();
  }

  Future<List<Article>?> getNews(String country, String category) async {
    try {
      final connectivityResult = await _checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw ("No internet connection found");
      }

      var url = Uri.https('newsapi.org', 'v2/top-headlines',
          {'country': country, 'apiKey': Config.apiKey, 'category': category});

      var response = await client.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> articlesData = data['articles'];
        print('data ==== ${articlesData}');

        List<Article> articles =
            articlesData.map((article) => Article.fromJson(article)).toList();
        return articles;
      } else {
        throw ("Failed to fetch articles. Status Code: ${response.statusCode}");
        // return []; // Empty list as a fallback
      }
    } catch (e) {
      throw ("Error fetching articles: $e");
    }
  }

  Future<List<Article>?> getBusiness(String country, String category) async {
    return await getNews(country, category);
  }

  Future<List<Article>?> getTechnology(String country, String category) async {
    return await getNews(country, category);
  }

  Future<List<Article>?> getSports(String country, String category) async {
    return await getNews(country, category);
  }

  Future<List<Article>?> getScience(String country, String category) async {
    return await getTechnology(country, category);
  }

  Future<List<Article>?> searchEverything(String anything) async {
    try {
      final connectivityResult = await _checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        throw ("No internet connection found");
      }

      var url = Uri.https('newsapi.org', 'v2/everything', {
        'q': anything,
        'apiKey': Config.apiKey,
      });

      var response = await client.get(url);
      print('++++++ ${response.request}');

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> articlesData = data['articles'];
        print('data ==== ${articlesData}');

        List<Article> articles =
            articlesData.map((article) => Article.fromJson(article)).toList();
        return articles;
      } else {
        return []; // Empty list as a fallback
      }
    } catch (e) {
      throw ("Error fetching articles: $e");
    }
  }
}
