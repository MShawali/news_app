import 'package:flutter/material.dart';
import 'package:flutter_application_news/constent.dart';
import 'package:flutter_application_news/widgets/category_list_view.dart';
import 'package:flutter_application_news/widgets/news_list_view.dart';
import 'package:flutter_application_news/widgets/news_list_view_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      backgroundColor: kPrimeryKeyBlue,
      appBar: AppBar(
        backgroundColor: kPrimeryKeyBlue,
        centerTitle: true,
        elevation: 0,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: kPrimeryKeyWhite,
                  fontSize: 22),
            ),
            Text(
              "Shawali",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.orange,
                  fontSize: 22),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: CustomScrollView(
              
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: CategoryListView(),
                ),

                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20,
                  ),
                ),
                
                
                NewsListViewBuilder(
                  category: 'general',
                ),
              ],
            ),
      ),
    );
  }
}

