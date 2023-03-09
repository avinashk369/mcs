import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/server_error.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/resources/product/product_repository.dart';
part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepositoryImpl;

  ProductBloc(this._productRepositoryImpl)
      : super(const ProductState.initial()) {
    on<LoadPrdoucts>(_loadProducts);
    on<RemoveProduct>(_removeProduct);
    on<AddProduct>(_addProduct);
    on<DeleteProduct>(_deleteFromCart);
    on<SearchProduct>(_searchProduct);
  }

  Future _searchProduct(SearchProduct event, Emitter<ProductState> emit) async {
    try {
      emit(const ProductLoading());
      await Future.delayed(const Duration(seconds: 3), () {});
      Map<String, dynamic> data = {
        "city_id": event.cityId,
        "search_keyword": event.keyword
      };
      List<ProductModel> productList =
          await _productRepositoryImpl.searchProduct(data);

      emit(SearchResult(products: productList));
    } on ServerError catch (error) {
      emit(ProductError(message: error.errorMessage));
    } catch (e) {
      emit(const ProductError(message: 'Something went wrong'));
    }
  }

  Future _addProduct(AddProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      List<ProductModel> cartProducts = [];
      if (state is ProductLoaded) {
        if (event.isCart) {
          cartProducts = state.addedProducts!
              .map(
                  (e) => e.id == event.productModel.id ? event.productModel : e)
              .toList();
        } else {
          cartProducts = state.addedProducts!
              .where((element) => element.id != event.productModel.id)
              .toList();
          cartProducts.add(event.productModel);
        }
        List<ProductModel> products = state.products
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();

        emit(ProductState.loaded(
          products: products,
          addedProducts: cartProducts,
        ));
      }
    } catch (e, stac) {
      print("stack trace ${stac.toString()}");
      emit(const ProductState.error(message: "Something went wrong"));
    }
  }

  Future _removeProduct(RemoveProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        List<ProductModel> products = state.products
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        List<ProductModel> personalCare = state.personalCare!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        List<ProductModel> dailyNeeds = state.dailyNeeds!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        List<ProductModel> dairyProducts = state.dairyProducts!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        List<ProductModel> cartProducts = state.addedProducts!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        if (event.productModel.count == 0) {
          cartProducts.remove(event.productModel);
        }

        emit(ProductLoaded(
          products: products,
          addedProducts: cartProducts,
          personalCare: personalCare,
          dailyNeeds: dailyNeeds,
          dairyProducts: dairyProducts,
        ));
      }
    } catch (e) {
      emit(const ProductError(message: "Something went wrong"));
    }
  }

  Future _deleteFromCart(
      DeleteProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        List<ProductModel> cartProducts = state.addedProducts!
            .where((element) => element.id != event.productModel.id)
            .toList();

        emit(ProductLoaded(
          products: state.products,
          addedProducts: cartProducts,
          personalCare: state.personalCare,
          dailyNeeds: state.dailyNeeds,
          dairyProducts: state.dairyProducts,
        ));
      }
    } catch (e) {
      emit(const ProductError(message: "Something went wrong"));
    }
  }

  Future _loadProducts(LoadPrdoucts event, Emitter<ProductState> emit) async {
    try {
      emit(const ProductLoading());
      await Future.delayed(const Duration(seconds: 3), () {});
      Map<String, dynamic> data = {
        "city_id": event.cityId,
        "category_id": event.categoryId
      };
      List<ProductModel> productList =
          await _productRepositoryImpl.loadProducts(data);

      emit(ProductLoaded(products: productList, addedProducts: const []));
    } on ServerError catch (e) {
      emit(ProductError(message: e.errorMessage));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
