import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/resources/restaurant/restaurant_repositoryImpl.dart';

import '../../models/models.dart'
    show BaseResponse, RestaurantModel, ProductModel;
part 'restaurant_bloc.freezed.dart';
part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepositoryImpl _restaurantRepositoryImpl;
  RestaurantBloc(this._restaurantRepositoryImpl)
      : super(const RestaurantState.initial()) {
    on<RestaurantEvent>(
      (event, emit) async {
        await event.map(
          loadRestaurant: (event) async => await _loadRestaurants(event, emit),
          loadRestaurantProducts: (event) async =>
              await _loadRestaurantProducts(event, emit),
        );
      },
    );
  }

  /// load restaurants
  Future<void> _loadRestaurants(
      LoadRestaurant event, Emitter<RestaurantState> emit) async {
    try {
      emit(const RestaurantLoading());
      BaseResponse<List<RestaurantModel>> response =
          await _restaurantRepositoryImpl.loadRestaurants(event.request);

      emit(response.status!
          ? RestaurantLoaded(restaurants: response.data!)
          : RestaurantError(message: response.message!));
    } catch (e) {
      emit(const RestaurantError(message: 'Somthing went wrong'));
    }
  }

  /// load restaurant products
  Future<void> _loadRestaurantProducts(
      LoadRestaurantProducts event, Emitter<RestaurantState> emit) async {
    try {
      emit(const RestaurantLoading());
      BaseResponse<List<ProductModel>> response =
          await _restaurantRepositoryImpl.loadProducts(event.request);
      emit(response.status!
          ? RestaurantProductLoaded(products: response.data!)
          : RestaurantError(message: response.message!));
    } catch (e) {
      emit(const RestaurantError(message: 'Somthing went wrong'));
    }
  }
}
