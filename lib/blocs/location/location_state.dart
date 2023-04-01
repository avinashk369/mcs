part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationInitial;
  const factory LocationState.loading() = LocationLoading;
  const factory LocationState.loaded(
      {required LocationData locationData,
      required geo.Placemark address}) = LocationLoaded;
  const factory LocationState.error({required String message}) = LocationError;
  const factory LocationState.permissionDenied() = PermisssionDenied;
  const factory LocationState.serviceDisabled() = ServiceDisabled;
}
