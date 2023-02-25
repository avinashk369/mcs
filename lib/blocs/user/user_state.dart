part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitialization;
  const factory UserState.loading() = UserLoading;
  const factory UserState.error({required String message}) = UserError;
  const factory UserState.loaded({required UserModel userModel}) = UserLoaded;
  const factory UserState.verified({required UserModel userModel}) =
      UserVerified;
}
