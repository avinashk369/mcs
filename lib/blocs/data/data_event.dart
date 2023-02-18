part of 'data_bloc.dart';

@freezed
class DataEvent with _$DataEvent {
  const factory DataEvent.loadCities() = LoadCities;
  const factory DataEvent.changeTheme({required bool status}) = ChangeTheme;
  const factory DataEvent.loadBanners({required String cityId}) = LoadBanners;
}
