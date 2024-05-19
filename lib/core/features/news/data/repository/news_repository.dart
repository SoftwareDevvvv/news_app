import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/features/news/data/domain/article.dart';

import '../../../../constants/assets manager/constants.dart';
class NewsRepository {
   final apiKey = dotenv.env['API_KEY'];
  fetchNews() async{
    var response = await http.get(Uri.parse("${Constants.baseUrl}&apiKey=$apiKey"));
    var data = jsonDecode(response.body);
    List<Article> articleList = [];
    if (response.statusCode == 200){
      for (var item in data['articles']){
        Article article = Article.fromJson(item);
        if (article.urlToImage.toString() != "null"){
          articleList.add(article);
        }
        
      }
      
  }
   return articleList;
  }
  Future<List<Article>> fetchNewsByCategory(String category) async {
    String url =
        '${Constants.baseUrl}&apiKey=$apiKey&category=$category';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> articles = jsonData['articles'];
      return List<Article>.from(articles.map((article) => Article.fromJson(article)));
    } else {
      throw Exception('Failed to load news');
    }
  }
}