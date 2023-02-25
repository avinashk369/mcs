import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/models/server_error.dart';
import 'package:mcs/services/ApiClient.dart';

import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient apiClient;

  ProductRepositoryImpl({required this.apiClient});

  @override
  Future<List<ProductModel>> loadProducts(Map<String, dynamic> data) async {
    late List<ProductModel> products;
    try {
      products = (await apiClient.getProducts(data)).data!;
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return products;
  }

  @override
  Future<List<ProductModel>> loadPersonalCare() async {
    late List<ProductModel> products;
    try {
      var response =
          await rootBundle.loadString('assets/jsons/personal_care.json');
      products = (json.decode(response) as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      products;
    } catch (error) {
      throw Exception("Something went wrong");
    }
    return products;
  }

  @override
  Future<List<ProductModel>> loadDailyNeeds() async {
    late List<ProductModel> products;
    try {
      var response =
          await rootBundle.loadString('assets/jsons/daily_needs.json');
      products = (json.decode(response) as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      products;
    } catch (error) {
      throw Exception("Something went wrong");
    }
    return products;
  }

  @override
  Future<List<ProductModel>> loadDairyProducts() async {
    late List<ProductModel> products;
    try {
      var response =
          await rootBundle.loadString('assets/jsons/dairy_bakery.json');
      products = (json.decode(response) as List)
          .map((data) => ProductModel.fromJson(data))
          .toList();

      products;
    } catch (error) {
      throw Exception("Something went wrong");
    }
    return products;
  }
}
