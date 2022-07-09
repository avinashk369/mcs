part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.loaded(
      {required List<ProductModel> products,
      List<ProductModel>? addedProducts,
      List<ProductModel>? personalCare,
      List<ProductModel>? dailyNeeds,
      List<ProductModel>? dairyProducts}) = ProductLoaded;
  const factory ProductState.error({required String message}) = ProductError;
}
