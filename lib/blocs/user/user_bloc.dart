import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mcs/models/models.dart'
    show
        BookingModel,
        UserModel,
        UserVehicleModel,
        BaseModel,
        ServerError,
        ReviewModel;
import 'package:mcs/models/payment/order.model.dart';
import 'package:mcs/resources/user/user_repositoryimpl.dart';
import 'package:meta/meta.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepositoryImpl _userRepositoryImpl;

  //UserBloc() : super(UserInitializing());

  UserBloc(this._userRepositoryImpl) : super(UserInitializing()) {
    on<UserLoginEvent>((event, emit) => _mapUserLoginEvent(event, emit));
    on<VerifyOtp>((event, emit) => verifyOtpEvent(event, emit));
    on<LoadUserVehicles>((event, emit) => loadUserVehiclesEvent(event, emit));
    on<AddUserVehicle>((event, emit) => addUserVehicleEvent(event, emit));
    on<LoadBookings>((event, emit) => loadBookingsEvent(event, emit));
    on<SubmitReview>((event, emit) => submitReviewEvent(event, emit));
    on<AddBookingEvent>((event, emit) => addBookingEvent(event, emit));
    on<UpdateBookingStatus>(
        (event, emit) => updateBookingStatusEvent(event, emit));
  }

  //update booking status
  Future updateBookingStatusEvent(
      UpdateBookingStatus event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());

      // first save the booking detail to the user then emit the state
      BookingModel bookingModel = await _userRepositoryImpl.updateBooking(
          token: event.token,
          bookingId: event.bookingModel.id!,
          bookingModel: event.bookingModel);
      //print("is paidi in update ${event.bookingModel.isPaid}");
      if (!event.bookingModel.isPaid!) {
        OrderModel orderModel = await createOrder(bookingModel);
        bookingModel.orderModel = orderModel;
        bookingModel.orderId = orderModel.id;
      }
      emit(BookingAdded(booking: bookingModel));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(BookingNotAdded(message: e.getErrorMessage()));
    } catch (e) {
      print("object error ${e.toString()}");
      emit(BookingNotAdded(message: e.toString()));
    }
  }

  /// add booking event handeling
  Future addBookingEvent(AddBookingEvent event, Emitter<UserState> emit) async {
    try {
      emit(UserLoading());
      // first save the booking detail to the user then emit the state
      BaseModel<BookingModel> bookingModel =
          await _userRepositoryImpl.addBooking(event.token, event.bookingModel);
      //print("is paid ${event.bookingModel['is_paid']}");
      if (!event.bookingModel['is_paid']) {
        OrderModel orderModel = await createOrder(bookingModel.data!);
        bookingModel.data!.orderModel = orderModel;
        bookingModel.data!.orderId = orderModel.id;
      }
      emit(BookingAdded(booking: bookingModel.data!));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(BookingNotAdded(message: e.getErrorMessage()));
    } catch (e) {
      print("object error ${e.toString()}");
      emit(BookingNotAdded(message: e.toString()));
    }
  }

  Future<OrderModel> createOrder(BookingModel bookingModel) async {
    late OrderModel orderModel;
    try {
      var apiKey = dotenv.env["RZR_PAY_KEY_ID"];
      var secret = dotenv.env["RZR_PAY_KEY_SECRET"];
      OrderModel orderData = OrderModel()
        ..currency = "INR"
        ..amount = bookingModel.price! * 100
        ..receipt = bookingModel.id;

      orderModel = await _userRepositoryImpl.createOrderApi(
          base64Encode(utf8.encode('$apiKey:$secret')), orderData);
    } catch (error) {
      throw ServerError.withError(error: error);
    }
    return orderModel;
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
      emit(BookingLoadingFailed(error: e.getErrorMessage()));
    } catch (e) {
      print("object error ${e.toString()}");
      emit(BookingLoadingFailed(error: e.toString()));
    }
  }

  //load bookings
  Future loadBookingsEvent(LoadBookings event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      List<BookingModel> bookings =
          await _userRepositoryImpl.loadBookings(event.token, event.userId);

      emit(BookingsLoaded(bookings: bookings));
    } on ServerError catch (e) {
      print("object server error ${e.getErrorMessage()}");
      emit(BookingLoadingFailed(error: e.getErrorMessage()));
    } catch (e) {
      print("object error ${e.toString()}");
      emit(BookingLoadingFailed(error: e.toString()));
    }
  }

  ///load user vehicles
  Future addUserVehicleEvent(
      AddUserVehicle event, Emitter<UserState> emit) async {
    final state = this.state;
    try {
      // first save the vehicle detail to the user then emit the state
      BaseModel<List<UserVehicleModel>> uvs = await _userRepositoryImpl
          .saveUserVehicle(event.token, event.userVehicleModel);

      if (state is UserVehiclesLoaded) {
        emit(
          UserVehiclesLoaded(
            vehicles: List.from(state.vehicles)..add(event.userVehicleModel),
          ),
        );
      }
      if (state is VehicleLoadingFailed) {
        emit(
          UserVehiclesLoaded(
            vehicles: List.from([])..add(uvs.data![0]),
          ),
        );
      }
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(VehiclesNotAdded(error: e.getErrorMessage()));
    } catch (e) {
      print("object error ${e.toString()}");
      emit(VehiclesNotAdded(error: e.toString()));
    }
  }

  ///load user vehicles
  Future loadUserVehiclesEvent(
      LoadUserVehicles event, Emitter<UserState> emit) async {
    late List<UserVehicleModel> userVehicles;
    try {
      userVehicles =
          await _userRepositoryImpl.userVehicles(event.token, event.userId);

      userVehicles.isEmpty
          ? emit(const VehicleLoadingFailed(error: "No vehicle found"))
          : emit(UserVehiclesLoaded(vehicles: userVehicles));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(VehicleLoadingFailed(error: e.getErrorMessage()));
    } catch (_) {
      emit(const VehicleLoadingFailed(error: "error"));
    }
  }

  /// user login event handeling
  Future<void> _mapUserLoginEvent(
      UserLoginEvent event, Emitter<UserState> emit) async {
    BaseModel<UserModel>? userModel;
    emit(UserLoading());

    try {
      userModel = await _userRepositoryImpl.userLogin(event.mobileNumber);

      emit(UserLoaded(userModel: userModel.data!));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(UserError(message: e.getErrorMessage()));
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
      userModel = await _userRepositoryImpl.verifyOtp(
          event.token, event.mobile, event.otp);
      emit(OtpVerified(userModel: userModel.data!));
    } on ServerError catch (e) {
      print("object server error ${e.toString()}");
      emit(UserError(message: e.getErrorMessage()));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
