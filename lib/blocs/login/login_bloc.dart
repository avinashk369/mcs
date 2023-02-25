import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
part 'login_bloc.freezed.dart';
part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginInitializing());

  Future<void> checkNumber(String mobileNumber) async {
    try {
      bool isValid = mobileNumber.length > 9;
      emit(ValidNumber(isValid: isValid, number: mobileNumber));
    } catch (_) {}
  }

  Future<void> checkOtp(int otp) async {
    try {
      emit(ValidOtp(isValid: otp.toString().length > 3, otp: otp));
    } catch (_) {}
  }
}
