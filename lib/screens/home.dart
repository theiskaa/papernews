import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/data/data.dart';
import 'package:news/data/news.dart';
import 'package:news/localization/app_localization.dart';
import 'package:news/models/article_model.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/info_lang.dart';
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
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () => fetchData(context),
    );
    Timer(
      Duration(seconds: 1),
      () => categories = getCategories(
        context,
        AppLocalizations.of(context).translate("general_title"),
        AppLocalizations.of(context).translate("entertainment_title"),
        AppLocalizations.of(context).translate("sport_title"),
        AppLocalizations.of(context).translate("technology_title"),
        AppLocalizations.of(context).translate("science_title"),
        AppLocalizations.of(context).translate("health_title"),
      ),
    );
  }

  fetchData(BuildContext context) async {
    News news = News();
    await news.fetchData(
      context,
      "${AppLocalizations.of(context).translate("country")}",
      // AppLocalizations.of(context).translate("country"),
    );
    articles = news.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: buildCustomAppBar(),
      drawer: buildDrawer(),
      body: isLoading
          ? Loading()
          : Container(
              child: buildBlogs(),
            ),
    );
  }

  CustomAppBar buildCustomAppBar() {
    return CustomAppBar(
      button: IconButton(
        icon: Icon(
          Icons.language,
          color: Colors.black,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InfoLang(),
          ),
        ),
      ),
      leading: IconButton(
        icon: Padding(
          padding: const EdgeInsets.all(5),
          child: Image.asset('assets/icons/menu.png'),
        ),
        onPressed: () => scaffoldKey.currentState.openDrawer(),
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
        alignment: Alignment.center,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)
                          .translate("categories_title"),
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
                    title: categories[index].title,
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
