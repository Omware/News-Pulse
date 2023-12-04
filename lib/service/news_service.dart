import 'package:newsapp/models/article.dart';
import 'package:newsapp/provider/news_provider.dart';

class NewsService {

  final _api = NewsApiProvider();

  Future<List<Article>?> getNews() async {
    return _api.getNews('us', '');
  }

  Future<List<Article>?> getBusiness() async {
    return _api.getBusiness('us', 'business');
  }

  Future<List<Article>?> getTechnology() async {
    return _api.getTechnology('us', 'technology');
  }

  Future<List<Article>?> getSports() async {
    return _api.getSports('us', 'sports');
  }

  Future<List<Article>?> getScience() async {
    return _api.getScience('us', 'science');
  }

  Future<List<Article>?> searchEverything(String anything) async {
    return _api.searchEverything(anything);
  }
}