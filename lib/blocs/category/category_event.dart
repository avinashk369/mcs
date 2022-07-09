part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadCategory() = LoadCategory;
  const factory CategoryEvent.loadSubcategory({required String catId}) =
      LoadSubcategory;
}
