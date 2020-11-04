import 'package:news/models/category_model.dart';

List<CategoryModel> getCategories() {
  var category = List<CategoryModel>();
  var categoryModel = CategoryModel();

  // 1. Health
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.categoryImageURL =
      "https://images.unsplash.com/photo-1535914254981-b5012eebbd15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80";

  // 2. Entertainment
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.categoryImageURL =
      "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80";
  category.add(categoryModel);

  // 3. General
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.categoryImageURL =
      "https://images.unsplash.com/photo-1562170142-04f38fb2827d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2978&q=80";
  category.add(categoryModel);

  // 4. Sport
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sport";
  categoryModel.categoryImageURL =
      "https://images.unsplash.com/photo-1530549387789-4c1017266635?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80";
  category.add(categoryModel);

  // 5. Technology
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.categoryImageURL =
      "https://images.unsplash.com/photo-1531297484001-80022131f5a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1907&q=80";
  category.add(categoryModel);

  // 6. Science
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.categoryImageURL =
      "https://images.unsplash.com/photo-1574170609519-d1d8d4b71f60?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80";
  category.add(categoryModel);

  return category;
}
