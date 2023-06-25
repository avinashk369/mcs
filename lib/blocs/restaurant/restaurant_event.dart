part of 'restaurant_bloc.dart';

@freezed
class RestaurantEvent with _$RestaurantEvent {
  const factory RestaurantEvent.loadRestaurant(
      {required Map<String, dynamic> request}) = LoadRestaurant;
  const factory RestaurantEvent.loadRestaurantProducts(
      {required Map<String, dynamic> request}) = LoadRestaurantProducts;
}
