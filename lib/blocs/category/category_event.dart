part of 'category_bloc.dart';

@freezed
class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.loadCategory({required String cityId}) =
      LoadCategory;
  const factory CategoryEvent.swapIndex(
      {required int current, required int last}) = SwapIndex;
}
