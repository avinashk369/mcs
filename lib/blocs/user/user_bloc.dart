import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mcs/models/models.dart'
    show UserModel, BaseModel, ServerError, ReviewModel;
import 'package:mcs/resources/user/user_repository.dart';
import 'package:meta/meta.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepositoryImpl;

  UserBloc(this._userRepositoryImpl) : super(UserInitializing()) {
    on<UserLoginEvent>(_userLogin);
    on<VerifyOtp>(verifyOtpEvent);
    on<SubmitReview>(submitReviewEvent);
  }

  //submit review
  Future submitReviewEvent(SubmitReview event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 3),
      );
      ReviewModel reviewModel =
          await _userRepositoryImpl.submitReview(event.token, event.data);

      emit(ReviewSubmitted(message: reviewModel.review!));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(BookingLoadingFailed(error: e.errorMessage));
    } catch (e) {
      print("object error ${e.toString()}");
      emit(BookingLoadingFailed(error: e.toString()));
    }
  }

  /// user login event handeling
  Future<void> _userLogin(UserLoginEvent event, Emitter<UserState> emit) async {
    BaseModel<UserModel>? userModel;
    emit(UserLoading());

    try {
      //userModel = await _userRepositoryImpl.userLogin(event.mobileNumber);

      emit(
        UserLoaded(
            userModel: UserModel()
              ..mobile = int.parse(event.mobileNumber)
              ..token = ''),
      );
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(UserError(message: e.errorMessage));
    } catch (e) {
      print("app error ${e.toString()}");
      emit(UserError(message: e.toString()));
    }
  }

  /// user otp verification event handeling
  Future<void> verifyOtpEvent(VerifyOtp event, Emitter<UserState> emit) async {
    BaseModel<UserModel>? userModel;
    emit(UserLoading());

    try {
      // userModel = await _userRepositoryImpl.verifyOtp(
      //     event.token, event.mobile, event.otp);
      emit(OtpVerified(userModel: UserModel()..token = ''));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(UserError(message: e.errorMessage));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
