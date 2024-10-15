import 'package:flutter/material.dart';
import 'package:flutter_application_news/models/Categorycard_model.dart';
import 'package:flutter_application_news/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(categoryImage: "assets/business.jpg", categoryName: "Business"),
    CategoryModel(categoryImage: "assets/entertaiment.jpg", categoryName: "Entertainment"),
    CategoryModel(categoryImage: "assets/general.jpg", categoryName: "General"),
    CategoryModel(categoryImage: "assets/health.jpg", categoryName: "Health"),
    CategoryModel(categoryImage: "assets/science.jpg", categoryName: "Science"),
    CategoryModel(categoryImage: "assets/sports.jpeg", categoryName: "Sports"),
    CategoryModel(categoryImage: "assets/technology.jpg", categoryName: "Technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: categories[index],
          );
        },
      ),
    );
  }
}
