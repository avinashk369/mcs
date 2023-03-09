import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mcs/models/models.dart'
    show ServerError, BaseResponse, ProductModel;

import 'package:mcs/services/ApiClient.dart';

import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient apiClient;

  ProductRepositoryImpl({required this.apiClient});

  @override
  Future<List<ProductModel>> loadProducts(Map<String, dynamic> data) async {
    late List<ProductModel> products;
    try {
      BaseResponse<List<ProductModel>> productList =
          await apiClient.getProducts(data);
      if (productList.status!) {
        products = productList.data!;
      } else {
        throw Exception(productList.message);
      }
    } catch (error, stackTrace) {
      print(stackTrace.toString());
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

  @override
  Future<List<ProductModel>> searchProduct(Map<String, dynamic> data) async {
    late List<ProductModel> products;
    try {
      BaseResponse<List<ProductModel>> productList =
          await apiClient.searchProducts(data);
      if (productList.status!) {
        products = productList.data!;
      } else {
        throw Exception(productList.message);
      }
    } catch (e) {
      throw ServerError.withError(error: e);
    }
    return products;
  }
}
