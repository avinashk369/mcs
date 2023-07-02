import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/server_error.dart';
import 'package:mcs/models/product/product_mode.dart';
import 'package:mcs/resources/product/product_repository.dart';
import 'package:mcs/utils/product_filter_enums.dart';

import '../../models/product/variant.dart';
part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepositoryImpl;

  ProductBloc(this._productRepositoryImpl)
      : super(const ProductState.initial()) {
    on<ProductEvent>(
      (event, emit) async {
        await event.mapOrNull(
          addProduct: (event) async => await _addProduct(event, emit),
          deleteProduct: (event) async => await _deleteFromCart(event, emit),
          loadProduct: (event) async => await _loadProducts(event, emit),
          loadRestaurantProducts: (event) async =>
              await _loadRestaurantProducts(event, emit),

          ///loadProductByCatId: (event) async => await _addProduct(event, emit),
          removeProduct: (event) async => await _removeProduct(event, emit),
          search: (event) async => await _searchProduct(event, emit),
          updatePrice: (event) async => await _updatePrice(event, emit),
          startSearch: (event) async => await _startSearch(event, emit),
          clearKart: (event) async => await _clearKart(event, emit),
          repeatOrder: (event) async => await _repeatOrder(event, emit),
          sortAndFilter: (event) async => await _sortAndFilter(event, emit),
        );
      },
    );
  }

  /// repeat order
  Future _repeatOrder(RepeatOrder event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      emit(const ProductLoading());
      List<ProductModel> products = event.products.map((e) {
        List<Variant> variants = [];
        Variant variant = Variant(
          discount: e.discount,
          price: e.price,
          maxQty: e.quantity,
        );
        variants.add(variant);
        return e.copyWith(
            variant: variants, index: 0, count: int.tryParse(e.quantity!)!);
      }).toList();
      emit(ProductLoaded(
          products: state is ProductLoaded ? state.products : [],
          addedProducts: products,
          shippingCharge: event.shippingCharge));
    } catch (e) {
      emit(const ProductError(message: 'Something went wrong'));
    }
  }

  /// clear kart event
  Future _clearKart(ClearKart event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        emit(const ProductLoaded(products: [], addedProducts: []));
      }
    } catch (e) {
      emit(const ProductError(message: 'Something went wrong'));
    }
  }

  /// start search event ehandeling to make loaded product list empty
  Future _startSearch(StartSearch event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        emit(ProductLoaded(products: [], addedProducts: state.addedProducts));
      }
    } catch (e) {
      emit(const ProductError(message: 'Something went wrong'));
    }
  }

  Future _searchProduct(SearchProduct event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      List<ProductModel> addedProducts = [];
      if (state is ProductLoaded) {
        addedProducts = state.addedProducts ?? [];
      }
      emit(const ProductLoading());
      await Future.delayed(const Duration(seconds: 3), () {});
      Map<String, dynamic> data = {
        "city_id": event.cityId,
        "search_keyword": event.keyword
      };
      List<ProductModel> productList =
          await _productRepositoryImpl.searchProduct(data);

      emit(ProductLoaded(products: productList, addedProducts: addedProducts));
    } on ServerError catch (error) {
      emit(ProductError(message: error.errorMessage));
    } catch (e) {
      emit(const ProductError(message: 'Something went wrong'));
    }
  }

  /// update product price
  Future _updatePrice(UpdatePrice event, Emitter<ProductState> emit) async {
    try {
      final state = this.state;
      if (state is ProductLoaded) {
        List<ProductModel> products = state.products
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        emit(ProductState.loaded(
            products: products, addedProducts: state.addedProducts!));
      }
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
        // List<ProductModel> personalCare = state.personalCare!
        //     .map((e) => e.id == event.productModel.id ? event.productModel : e)
        //     .toList();
        // List<ProductModel> dailyNeeds = state.dailyNeeds!
        //     .map((e) => e.id == event.productModel.id ? event.productModel : e)
        //     .toList();
        // List<ProductModel> dairyProducts = state.dairyProducts!
        //     .map((e) => e.id == event.productModel.id ? event.productModel : e)
        //     .toList();
        List<ProductModel> cartProducts = state.addedProducts!
            .map((e) => e.id == event.productModel.id ? event.productModel : e)
            .toList();
        if (event.productModel.count == 0) {
          cartProducts.remove(event.productModel);
        }

        emit(ProductLoaded(
          products: products,
          addedProducts: cartProducts,
          // personalCare: personalCare,
          // dailyNeeds: dailyNeeds,
          // dairyProducts: dairyProducts,
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
          dailyNeeds: state.dailyNeeds,
          dairyProducts: state.dairyProducts,
        ));
      }
    } catch (e) {
      emit(const ProductError(message: "Something went wrong"));
    }
  }

  Future _loadProducts(LoadPrdoucts event, Emitter<ProductState> emit) async {
    List<ProductModel> addedProducts = [];
    Set<ProductModel> loadedProducts = {};
    try {
      final state = this.state;

      if (state is ProductLoaded) {
        int existingCat = state.addedProducts!
            .indexWhere((element) => element.categoryId == event.categoryId);
        addedProducts = (event.isFood)
            ? existingCat != -1
                ? state.addedProducts!
                : []
            : state.addedProducts!;
        loadedProducts = (event.isFood)
            ? existingCat != -1
                ? state.products.toSet()
                : {}
            : state.products.toSet();
        //emit(state);
      }
      if (state is ProductError) {
        int existingCat = state.addedProducts!
            .indexWhere((element) => element.categoryId == event.categoryId);
        addedProducts = existingCat != -1 ? state.addedProducts! : [];
        //emit(state);
      }
      emit(const ProductLoading());
      //await Future.delayed(const Duration(seconds: 3), () {});
      Map<String, dynamic> data = {
        "city_id": event.cityId,
        "category_id": event.categoryId
      };
      List<ProductModel> productList =
          await _productRepositoryImpl.loadProducts(data);

      /// ! REMOVE THIS LINE WHEN ADD_ON TESTING ARE DONE
      productList.sort((a, b) => b.addOnStatus!.compareTo(a.addOnStatus!));
      loadedProducts.addAll(productList.toSet());

      emit(ProductLoaded(
        products: loadedProducts.toList(),
        addedProducts: addedProducts,
      ));
    } on ServerError catch (e) {
      emit(ProductError(message: e.errorMessage, addedProducts: addedProducts));
    } catch (e) {
      emit(ProductError(message: e.toString(), addedProducts: addedProducts));
    }
  }

  Future _sortAndFilter(SortAndFilter event, Emitter<ProductState> emit) async {
    List<ProductModel> addedProducts = [];
    try {
      final state = this.state;

      if (state is ProductLoaded) {
        addedProducts = state.addedProducts!;
        List<ProductModel> productList =
            List<ProductModel>.from(state.products);

        /// veg non-veg
        (event.filterMap['sort'] == ProductFilterType.veg.filterName)
            ? productList.sort(((a, b) => a.name!.compareTo(b.name!)))
            : productList.sort(((a, b) => b.name!.compareTo(a.name!)));

        /// price high-low
        (event.filterMap['sort'] == ProductFilterType.priceToLow.filterName)
            ? productList.sort(((a, b) =>
                a.variant![0].price!.compareTo(b.variant![0].price!)))
            : productList.sort(((a, b) =>
                b.variant![0].price!.compareTo(a.variant![0].price!)));

        emit(state.copyWith(
            products: productList, addedProducts: addedProducts));
      }
    } on ServerError catch (e) {
      emit(ProductError(message: e.errorMessage, addedProducts: addedProducts));
    } catch (e) {
      emit(ProductError(message: e.toString(), addedProducts: addedProducts));
    }
  }

  Future _loadRestaurantProducts(
      LoadRestaurantProducts event, Emitter<ProductState> emit) async {
    List<ProductModel> addedProducts = [];
    try {
      final state = this.state;

      if (state is ProductLoaded) {
        addedProducts = state.addedProducts!;
      }
      if (state is ProductError) {
        addedProducts = state.addedProducts!;
      }
      emit(const ProductLoading());
      Map<String, dynamic> data = {
        "city_id": event.cityId,
        "category_id": event.categoryId
      };
      List<ProductModel> productList =
          await _productRepositoryImpl.loadProducts(data);

      emit(ProductLoaded(products: productList, addedProducts: addedProducts));
    } on ServerError catch (e) {
      emit(ProductError(message: e.errorMessage, addedProducts: addedProducts));
    } catch (e) {
      emit(ProductError(message: e.toString(), addedProducts: addedProducts));
    }
  }
}
