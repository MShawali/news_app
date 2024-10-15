import 'package:flutter/material.dart';
import 'package:flutter_application_news/models/news_model.dart';
import 'package:flutter_application_news/widgets/news_card.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.article});

  final List<ArticleModel> article;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: article.length,
        (context, index) {
          return NewsCard(
            articleModel: article[index],
          );
        },
      ),
    );
  }
}
