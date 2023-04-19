import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/user/user_model.dart';

import '../../models/server_error.dart';
import '../../resources/user/user_repository.dart';
part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepositoryImpl;
  UserBloc(this._userRepositoryImpl) : super(const UserState.initial()) {
    on<UserLoginEvent>(_userLogin);
    on<VerifyOtp>(_verifyOtpEvent);
    on<ResendOtp>(_resendOtp);
    on<SaveAddress>(_saveAddress);
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
      UserModel userModel =
          await _userRepositoryImpl.userLogin(event.mobileNumber);
      emit(UserLoaded(userModel: userModel));
    } on ServerError catch (e) {
      emit(UserError(message: e.errorMessage));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }

  /// user otp verification event handeling
  Future<void> _verifyOtpEvent(VerifyOtp event, Emitter<UserState> emit) async {
    emit(const UserLoading());
    try {
      UserModel userModel =
          await _userRepositoryImpl.verifyOtp(event.mobileNumber, event.otp);
      emit(userModel.status!
          ? UserLoaded(userModel: userModel)
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
