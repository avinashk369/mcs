import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:location/location.dart';
part 'location_bloc.freezed.dart';
part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationInitial()) {
    on<LocationEvent>(
      (event, emit) async {
        await event.map(
          loadLocation: (event) async => await _loadLocation(event, emit),
        );
      },
    );
  }

  /// get user current location
  Future _loadLocation(LoadLocation event, Emitter<LocationState> emit) async {
    try {
      late LocationData? userLocation;
      Location location = Location();
      late bool serviceEnabled;
      late PermissionStatus permissionGranted;
      // Check if location service is enable
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
          //emit(const ServiceDisabled())
        }
      }

      // Check if permission is granted
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;

          //emit(const PermisssionDenied());
        }
      }

      userLocation = await location.getLocation();

      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          userLocation.latitude!, userLocation.longitude!);

      ///LocationData<lat: 12.8980637, long: 77.6441265>, address:       Name: 40,
      // Street: 40,
      // ISO Country Code: IN,
      // Country: India,
      // Postal code: 560068,
      // Administrative area: Karnataka,
      // Subadministrative area: Bangalore Division,
      // Locality: Bengaluru,
      // Sublocality: Muneshwara Nagar,
      // Thoroughfare: 5th Main Road,
      // Subthoroughfare: 40) }

      emit(LocationLoaded(
          locationData: userLocation, address: placemarks.first));
    } catch (e) {
      emit(const LocationError(message: 'Unable to get location'));
    }
  }
}
