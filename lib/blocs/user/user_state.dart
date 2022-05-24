part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
}

class UserInitializing extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserError extends UserState {
  String message;
  UserError({required this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}

class UserLoaded extends UserState {
  @override
  // TODO: implement props
  final UserModel userModel;

  const UserLoaded({required this.userModel});

  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class OtpVerified extends UserState {
  @override
  // TODO: implement props
  final UserModel userModel;

  const OtpVerified({required this.userModel});

  @override
  // TODO: implement props
  List<Object> get props => [userModel];
}

class UserVehiclesLoaded extends UserState {
  final List<UserVehicleModel> vehicles;

  const UserVehiclesLoaded({required this.vehicles});

  @override
  List<Object> get props => [vehicles];
}

class UserVehicleAdded extends UserState {
  final UserVehicleModel vehicle;

  const UserVehicleAdded({required this.vehicle});

  @override
  List<Object> get props => [vehicle];
}

class VehicleLoadingFailed extends UserState {
  final String error;

  const VehicleLoadingFailed({required this.error});

  @override
  List<Object> get props => [error];
}

class VehiclesNotAdded extends UserState {
  final String error;
  const VehiclesNotAdded({required this.error});
  @override
  List<Object> get props => [error];
}

class BookingsLoaded extends UserState {
  final List<BookingModel> bookings;

  const BookingsLoaded({required this.bookings});

  @override
  List<Object> get props => [bookings];
}

class BookingLoadingFailed extends UserState {
  final String error;

  const BookingLoadingFailed({required this.error});

  @override
  List<Object> get props => [error];
}

class ReviewSubmitted extends UserState {
  final String message;

  const ReviewSubmitted({required this.message});

  @override
  List<Object> get props => [message];
}

class BookingAdded extends UserState {
  final BookingModel booking;

  const BookingAdded({required this.booking});

  @override
  List<Object> get props => [booking];
}

class BookingNotAdded extends UserState {
  final String message;

  const BookingNotAdded({required this.message});

  @override
  List<Object> get props => [message];
}
