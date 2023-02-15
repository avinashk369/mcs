part of 'data_bloc.dart';

@freezed
class DataState with _$DataState {
  const factory DataState.initial() = DataInitial;
  const factory DataState.loading() = DataLoading;
  const factory DataState.cityLoaded({required List<CityModel> cities}) =
      CityLoaded;
  const factory DataState.error({required String message}) = DataError;
}
