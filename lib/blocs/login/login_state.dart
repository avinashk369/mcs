part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitializing;
  const factory LoginState.validnumber(
      {required bool isValid, required String number}) = ValidNumber;
  const factory LoginState.validOtp({required bool isValid, required int otp}) =
      ValidOtp;
}
