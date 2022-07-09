part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryInitial;
  const factory CategoryState.loaded(
      {required List<CategoryModel> categories}) = CategoryLoaded;
  const factory CategoryState.error({required String message}) = CategoryError;
  const factory CategoryState.subCatLoaded(
      {required List<SubcatModel> subcats}) = SubcatLoaded;
}
