part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.login({required String mobileNumber}) =
      UserLoginEvent;
  const factory UserEvent.verifyOtp(
      {required String mobileNumber, required int otp}) = VerifyOtp;
  const factory UserEvent.resendOtp({required String mobile}) = ResendOtp;
  const factory UserEvent.saveAddress({required Map<String, dynamic> data}) =
      SaveAddress;
}
