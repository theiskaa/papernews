import 'package:news/models/category_model.dart';

List getCategories(
  String general,
  String entertainment,
  String sport,
  String tech,
  String science,
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

  return category;
}
