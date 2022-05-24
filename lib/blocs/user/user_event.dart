part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoginEvent extends UserEvent {
  final String mobileNumber;
  const UserLoginEvent({required this.mobileNumber});
  @override
  List<Object> get props => [];
}

class VerifyOtp extends UserEvent {
  final String otp;
  final String token;
  final String mobile;
  const VerifyOtp({
    required this.otp,
    required this.token,
    required this.mobile,
  });
  @override
  List<Object> get props => [];
}

class LoadUserVehicles extends UserEvent {
  final String token;
  final String userId;
  const LoadUserVehicles({
    required this.token,
    required this.userId,
  });
  @override
  List<Object> get props => [];
}

class AddUserVehicle extends UserEvent {
  final String token;
  final UserVehicleModel userVehicleModel;
  const AddUserVehicle({required this.token, required this.userVehicleModel});
  @override
  List<Object> get props => [];
}

class LoadBookings extends UserEvent {
  final String token;
  final String userId;
  const LoadBookings({
    required this.token,
    required this.userId,
  });
  @override
  List<Object> get props => [];
}

class SubmitReview extends UserEvent {
  final String token;
  final Map<String, dynamic> data;
  const SubmitReview({
    required this.token,
    required this.data,
  });
  @override
  List<Object> get props => [];
}

class AddBookingEvent extends UserEvent {
  final String token;
  final Map<String, dynamic> bookingModel;
  const AddBookingEvent({required this.token, required this.bookingModel});
  @override
  List<Object> get props => [];
}

class UpdateBookingStatus extends UserEvent {
  final String token;
  final BookingModel bookingModel;
  const UpdateBookingStatus({
    required this.token,
    required this.bookingModel,
  });
  @override
  List<Object> get props => [];
}
