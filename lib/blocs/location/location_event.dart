part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.loadLocation() = LoadLocation;
  const factory LocationEvent.getCurrentCity(
      {required Map<String, dynamic> data}) = GetCurrentCity;
}
