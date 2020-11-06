import 'package:flutter/material.dart';
import 'package:news/data/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/widget/blog_cart.dart';
import 'package:news/widget/custom_appbar.dart';
import 'package:news/widget/loading.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  CategoryScreen({
    this.category,
  });
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var articles = List<ArticleModel>();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCategoriesData();
  }

  fetchCategoriesData() async {
    CategoryNews news = CategoryNews();
    await news.fetchCategoriesDATA(
      
      widget.category,
    );
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _isLoading
          ? Loading()
          : Container(
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
            ),
    );
  }
}
