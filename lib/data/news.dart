import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news/localization/app_localization.dart';
import 'package:news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> fetchData(BuildContext context, String country) async {
    String country = "${AppLocalizations.of(context).translate("country")}";
    String url =
        "http://newsapi.org/v2/top-headlines?country=$country&category=general&apiKey=9ae5e1bfa42a4e34a9c7c86891d49976";

    var res = await http.get(url);
    var customJsonDecoder = jsonDecode(res.body);
    if (customJsonDecoder['status'] == 'ok') {
      customJsonDecoder['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            var articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
            );

            news.add(articleModel);
          }
        },
      );
    }
  }
}

class CategoryNews {
  List<ArticleModel> news = [];

  Future<void> fetchCategoriesDATA(
    BuildContext context,
    String category,
  ) async {
    String country = "${AppLocalizations.of(context).translate("country")}";
    String url =
        "http://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=9ae5e1bfa42a4e34a9c7c86891d49976";

    var res = await http.get(url);
    var customJsonDecoder = jsonDecode(res.body);
    if (customJsonDecoder['status'] == 'ok') {
      customJsonDecoder['articles'].forEach(
        (element) {
          if (element['urlToImage'] != null && element['description'] != null) {
            var articleModel = ArticleModel(
              title: element['title'],
              description: element['description'],
              author: element['author'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
            );

            news.add(articleModel);
          }
        },
      );
    }
  }
}
