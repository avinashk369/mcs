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
    on<LoadPrdoucts>((event, emit) => _loadProducts(event, emit));
    on<RemoveProduct>((event, emit) => _removeProduct(event, emit));
    on<AddProduct>((event, emit) => _addProduct(event, emit));
    on<DeleteProduct>((event, emit) => _deleteFromCart(event, emit));
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

        List<ProductModel> personalCare = state.personalCare!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        List<ProductModel> dailyNeeds = state.dailyNeeds!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        List<ProductModel> dairyProducts = state.dairyProducts!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        emit(ProductState.loaded(
          products: products,
          addedProducts: cartProducts,
          dailyNeeds: dailyNeeds,
          dairyProducts: dairyProducts,
          personalCare: personalCare,
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
      await Future.delayed(const Duration(seconds: 3), () {});
      List<ProductModel> productList =
          await _productRepositoryImpl.loadProducts();
      List<ProductModel> personalCare =
          await _productRepositoryImpl.loadPersonalCare();
      List<ProductModel> dailyNeeds =
          await _productRepositoryImpl.loadDailyNeeds();
      List<ProductModel> dairyProducts =
          await _productRepositoryImpl.loadDairyProducts();

      emit(ProductLoaded(
          products: productList,
          addedProducts: const [],
          personalCare: personalCare,
          dailyNeeds: dailyNeeds,
          dairyProducts: dairyProducts));
    } on ServerError catch (e) {
      emit(ProductError(message: e.errorMessage));
    } catch (e) {
      emit(ProductError(message: e.toString()));
    }
  }
}
