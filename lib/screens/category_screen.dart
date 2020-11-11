import 'dart:async';

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
  bool isGridView = false;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => fetchCategoriesData(context),
    );
  }

  fetchCategoriesData(BuildContext context) async {
    CategoryNews news = CategoryNews();
    await news.fetchCategoriesDATA(
      context,
      //"${AppLocalizations.of(context).translate("country")}",
      widget.category,
    );
    articles = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  void changeIconWithListView() {
    setState(() {
      isGridView = !isGridView;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context),
      body: _isLoading
          ? Loading()
          : Container(
              child: buildBlogListFIRST(),
            ),
    );
  }

  Container buildBlogListFIRST() {
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

  CustomAppBar buildCustomAppBar(BuildContext context) {
    return CustomAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      button: IconButton(
        icon: isGridView ? Icon(Icons.list) : Icon(Icons.grid_on),
        onPressed: changeIconWithListView,
      ),
    );
  }
}
