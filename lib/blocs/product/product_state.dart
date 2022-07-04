part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.loading() = ProductLoading;
  const factory ProductState.loaded(
      {required List<ProductModel> products,
      required List<ProductModel> addedProducts,
      required List<ProductModel> personalCare,
      required List<ProductModel> dailyNeeds,
      required List<ProductModel> dairyProducts}) = ProductLoaded;
  const factory ProductState.error({required String message}) = ProductError;
}
