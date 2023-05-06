import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/user/user_model.dart';

import '../../models/base_response.dart';
import '../../models/server_error.dart';
import '../../models/user/auth_model.dart';
import '../../models/user/user_address.dart';
import '../../resources/user/user_repository.dart';
part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepositoryImpl;
  UserBloc(this._userRepositoryImpl) : super(const UserState.initial()) {
    on<UserEvent>(
      (event, emit) async {
        await event.map(
          login: (event) async => await _userLogin(event, emit),
          emptyEvent: (_) async => await _emptyState(emit),
          resendOtp: (event) async => await _resendOtp(event, emit),
          saveAddress: (event) async => await _saveAddress(event, emit),
          updateProfile: (event) async => await _updateProfile(event, emit),
          verifyOtp: (event) async => await _verifyOtpEvent(event, emit),
          loadAddress: (event) async => await _loadAddress(event, emit),
        );
      },
    );
  }

  Future _loadAddress(LoadAddress event, Emitter<UserState> emit) async {
    try {
      emit(const UserLoading());
      List<UserAddress> userAddress =
          await _userRepositoryImpl.loadAddress(event.data);
      emit(AddressLoaded(userAddress: userAddress));
    } on ServerError catch (e) {
      emit(UserError(message: e.errorMessage));
    } catch (e, _) {
      emit(UserError(message: e.toString()));
    }
  }

  ///empty event
  Future _emptyState(Emitter<UserState> emit) async {
    emit(const EmptyState());
  }

  /// update profile
  Future _updateProfile(UpdateProfile event, Emitter<UserState> emit) async {
    try {
      emit(const UserLoading());
      BaseResponse<UserModel> userModel =
          await _userRepositoryImpl.updateProfile(event.userModel);
      emit(ProfileUpdated(userModel: userModel.data!));
    } on ServerError catch (e) {
      emit(UserError(message: e.errorMessage));
    } catch (e, _) {
      emit(UserError(message: e.toString()));
    }
  }

  /// save user address
  Future _saveAddress(SaveAddress event, Emitter<UserState> emit) async {
    try {
      emit(const UserLoading());
      await _userRepositoryImpl.saveAddress(event.data);
      emit(const AddressSaved(message: 'User address saved successfully!'));
    } catch (e) {
      emit(const UserError(message: 'Something went wrong'));
    }
  }

  /// user login event handeling
  Future<void> _userLogin(UserLoginEvent event, Emitter<UserState> emit) async {
    emit(const UserLoading());

    try {
      AuthModel authModel =
          await _userRepositoryImpl.userLogin(event.mobileNumber);
      emit(Authorized(authModel: authModel));
    } on ServerError catch (e) {
      emit(UserError(message: e.errorMessage));
    } catch (e, _) {
      emit(UserError(message: e.toString()));
    }
  }

  /// user otp verification event handeling
  Future<void> _verifyOtpEvent(VerifyOtp event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      BaseResponse<UserModel> userModel =
          await _userRepositoryImpl.verifyOtp(event.mobileNumber, event.otp);
      emit(userModel.status!
          ? UserLoaded(
              userModel: userModel.data!
                  .copyWith(userType: userModel.newUser.toString()))

          /// if user object need isNew user param
          : UserError(message: userModel.message!));
    } on ServerError catch (e) {
      emit(UserError(message: e.errorMessage));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  /// resend otp event handeling
  Future<void> _resendOtp(ResendOtp event, Emitter<UserState> emit) async {
    try {
      UserModel userModel = await _userRepositoryImpl.resendOtp(event.mobile);
      emit(UserLoaded(userModel: userModel));
    } on ServerError catch (error) {
      emit(UserError(message: error.errorMessage));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
