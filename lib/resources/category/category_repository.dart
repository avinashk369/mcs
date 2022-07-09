import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/subcat/subcat_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories();
  Future<List<SubcatModel>> getSubCategories(String catId);
}
