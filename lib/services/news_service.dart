import 'package:dio/dio.dart';
import 'package:flutter_application_news/models/news_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  final String apiKey = "966d9dc48c4e4cbaaf08d2e1840875a7";
  final String domin = "https://newsapi.org/v2";
  Future<List<ArticleModel>> getNews({required String category}) async {
    return Future.delayed(const Duration(seconds: 1), () async {
      try {
        Response response = await dio.get(
            "$domin/top-headlines?country=us&apiKey=$apiKey&category=$category");

        Map<String, dynamic> jsonData = response.data;

        List<dynamic> articles = jsonData["articles"];

        List<ArticleModel> articlesList = [];

        for (var article in articles) {
          ArticleModel articleModel = ArticleModel.fromJson(article);

          articlesList.add(articleModel);
        }

        return articlesList;
      } catch (e) {
        return [];
      }
    });
  }
}
