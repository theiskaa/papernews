import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/data.dart';
import 'package:news/data/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/widget/blog_cart.dart';
import 'package:news/widget/category_card.dart';
import 'package:news/widget/custom_appbar.dart';
import 'package:news/widget/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categories = List<CategoryModel>();
  var articles = List<ArticleModel>();
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    fetchData();
  }

  fetchData() async {
    News news = News();
    await news.fetchData();
    articles = news.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: buildDrawer(),
      body: isLoading
          ? Loading()
          : Container(
              child: buildBlogs(),
            ),
    );
  }

  Container buildBlogs() {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return BlogCard(
            image: articles[index].urlToImage,
            title: articles[index].title,
            des: articles[index].description,
            url: articles[index].url,
          );
        },
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "Categories",
                      style: GoogleFonts.turretRoad(
                          fontSize: 35, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    name: categories[index].categoryName,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
