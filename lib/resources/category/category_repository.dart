import 'package:mcs/models/category/category_model.dart';

import '../../models/category/subcat_model.dart';

abstract class CategoryRepository {
  Future<List<CategoryModel>> getCategories(String cityId);
  Future<List<SubCateModel>> getSubCategories(String cityId, String catId);
}
