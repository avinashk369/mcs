part of 'restaurant_bloc.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState.initial() = RestaurantInitializing;
  const factory RestaurantState.loading() = RestaurantLoading;
  const factory RestaurantState.loaded(
      {required List<RestaurantModel> restaurants}) = RestaurantLoaded;
  const factory RestaurantState.productLoaded(
      {required List<ProductModel> products}) = RestaurantProductLoaded;
  const factory RestaurantState.error({required String message}) =
      RestaurantError;
}
