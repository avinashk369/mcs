part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.loadProduct(
      {String? categoryId, required String cityId}) = LoadPrdoucts;
  const factory ProductEvent.addProduct(
      {required ProductModel productModel, required bool isCart}) = AddProduct;
  const factory ProductEvent.removeProduct(ProductModel productModel) =
      RemoveProduct;
  const factory ProductEvent.deleteProduct(ProductModel productModel) =
      DeleteProduct;
  const factory ProductEvent.loadProductByCatId({required String catId}) =
      LoadProductByCatId;
  const factory ProductEvent.search(
      {required String keyword, required String cityId}) = SearchProduct;

  const factory ProductEvent.updatePrice({required ProductModel productModel}) =
      UpdatePrice;
  const factory ProductEvent.startSearch() = StartSearch;
  const factory ProductEvent.clearKart() = ClearKart;
}
