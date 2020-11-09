import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';

List getCategories(
  BuildContext context,
  String general,
  String entertainment,
  String sport,
  String tech,
  String science,
  String health,
) {
  var category = List<CategoryModel>();
  var categoryModel = CategoryModel();

  // 1. General
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.title = general;
  category.add(categoryModel);

  // 2. Entertainment
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.title = entertainment;
  category.add(categoryModel);

  // 3. Sport
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sport";
  categoryModel.title = sport;
  category.add(categoryModel);

  // 4. Technology
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.title = tech;
  category.add(categoryModel);

  // 5. Science
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.title = science;
  category.add(categoryModel);

  // 5. Health
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.title = health;
  category.add(categoryModel);

  return category;
}

/*
Timer(
      Duration(seconds: 1),
      () => categories = getCategories(
        AppLocalizations.of(context).translate("general_title");
        AppLocalizations.of(context).translate("entertainment_title"),
        AppLocalizations.of(context).translate("sport_title"),
        AppLocalizations.of(context).translate("technology_title"),
        AppLocalizations.of(context).translate("science_title"),
      ),
    );
*/
