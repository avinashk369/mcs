import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/subcat/subcat_model.dart';
import 'package:mcs/services/ApiClient.dart';

import 'category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final ApiClient apiClient;

  CategoryRepositoryImpl({required this.apiClient});

  @override
  Future<List<CategoryModel>> getCategories() async {
    late List<CategoryModel> categories;
    try {
      var response = await rootBundle.loadString('assets/jsons/category.json');
      categories = (json.decode(response) as List)
          .map((data) => CategoryModel.fromJson(data))
          .toList();

      categories;
    } catch (error) {
      throw Exception("Something went wrong");
    }
    return categories;
  }

  @override
  Future<List<SubcatModel>> getSubCategories(String catId) async {
    late List<SubcatModel> subcats;
    try {
      var response = await rootBundle.loadString('assets/jsons/subcat.json');
      subcats = (json.decode(response) as List)
          .map((data) => SubcatModel.fromJson(data))
          .toList();

      subcats;
    } catch (error) {
      throw Exception("Something went wrong");
    }
    return subcats;
  }
}
