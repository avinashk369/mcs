part of 'subcat_bloc.dart';

@freezed
class SubcatState with _$SubcatState {
  const factory SubcatState.initial() = SubcatInitializing;
  const factory SubcatState.loading() = SubcatLoading;
  const factory SubcatState.error({required String message}) = SubcatError;
  const factory SubcatState.loaded(
      {required List<SubCateModel> subcats, String? catName}) = SubcatLoaded;
}
