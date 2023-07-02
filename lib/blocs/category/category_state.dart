part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryInitial;
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.loaded(
      {required List<CategoryModel> categories}) = CategoryLoaded;
  const factory CategoryState.swaped(
      {required List<CategoryModel> categories}) = CategorySwaped;
  const factory CategoryState.error({required String message}) = CategoryError;
  const factory CategoryState.swappedItems(
      {required List<CategoryModel> categories}) = SwappedItems;
}
