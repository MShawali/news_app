import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_news/constent.dart';
import 'package:flutter_application_news/models/news_model.dart';
import 'package:flutter_application_news/services/news_service.dart';
import 'package:flutter_application_news/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});

  final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(
      category: widget.category
      );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(
            article: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Text("oops there was an error, try later"),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(
                color: kPrimeryKeyWhite,
              ),
            ),
          );
        }
      },
    );
  }
}
