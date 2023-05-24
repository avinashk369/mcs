part of 'user_bloc.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.initial() = UserInitialization;
  const factory UserState.loading() = UserLoading;
  const factory UserState.authorized({required AuthModel authModel}) =
      Authorized;
  const factory UserState.error({required String message}) = UserError;
  const factory UserState.addressSaved({required String message}) =
      AddressSaved;
  const factory UserState.loaded({required UserModel userModel}) = UserLoaded;
  const factory UserState.verified({required UserModel userModel}) =
      UserVerified;
  const factory UserState.profileUpdated({required UserModel userModel}) =
      ProfileUpdated;
  const factory UserState.emptyState() = EmptyState;
  const factory UserState.addressLoaded(
      {required List<UserAddress> userAddress}) = AddressLoaded;
  const factory UserState.defaultAddressAdded({required String message}) =
      DefaultAddressAdded;
}
