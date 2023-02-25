import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/services/ApiClient.dart';

import '../../models/category/subcat_model.dart';
import '../../models/server_error.dart';
import 'category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final ApiClient apiClient;

  CategoryRepositoryImpl({required this.apiClient});

  @override
  Future<List<CategoryModel>> getCategories(String cityId) async {
    late List<CategoryModel> categories;
    try {
      categories = (await apiClient.getCategories({'city_id': cityId})).data!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return categories;
  }

  @override
  Future<List<SubCateModel>> getSubCategories(
      String cityId, String catId) async {
    late List<SubCateModel> subCategories;
    try {
      subCategories = (await apiClient
              .getSubCategories({'city_id': cityId, 'category_id': catId}))
          .data!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return subCategories;
  }
}
