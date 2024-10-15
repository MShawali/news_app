class ArticleModel {
  final String? articleImage;
  final String articleTitle;
  final String? articleSubTitle;
  final String webViewUrl;

  ArticleModel({
    required this.webViewUrl,
    required this.articleImage,
    required this.articleTitle,
    required this.articleSubTitle,
  });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
        webViewUrl: json['url'],
        articleImage: json["urlToImage"],
        articleTitle: json["title"],
        articleSubTitle: json["description"]);
  }
}
