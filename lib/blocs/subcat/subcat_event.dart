part of 'subcat_bloc.dart';

@freezed
class SubcatEvent with _$SubcatEvent {
  const factory SubcatEvent.loadsubcat(
      {required String cityId,
      required String catId,
      String? catName}) = LoadSubcat;
}
