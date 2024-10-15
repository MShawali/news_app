import 'package:flutter/material.dart';
import 'package:flutter_application_news/constent.dart';
import 'package:flutter_application_news/models/news_model.dart';
import 'package:flutter_application_news/views/web_view.dart';


class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.articleModel,
  });

  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsWebView(
                url: articleModel.webViewUrl,
                title: articleModel.articleTitle.substring(0, 25),
                
              ),
            ),
          );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: articleModel.articleImage != null
                  ? Image.network(
                      articleModel.articleImage!,
                      width: double.infinity,
                    )
                  : const SizedBox(
                      height: 2,
                    ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              articleModel.articleTitle,
              style: const TextStyle(
                color: kPrimeryKeyWhite,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            articleModel.articleSubTitle != null
                ? Text(
                    articleModel.articleSubTitle!,
                    style: const TextStyle(
                      color: kPrimeryKeyWhite50,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                : const SizedBox(
                    height: 2,
                  )
          ],
        ),
      ),
    );
  }
}
