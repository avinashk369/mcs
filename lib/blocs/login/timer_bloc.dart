import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'timer_bloc.freezed.dart';
part 'timer_state.dart';

class TimerBloc extends Cubit<TimerState> {
  TimerBloc() : super(const TimerInitializing());

  ///timer variable
  final _durationTimeOut = const Duration(seconds: 10);
  var isCanResendCode = false;
  var durationCountdown = 0;

  late Timer _timer;

  Future<void> validateCountdownResendCode() async {
    try {
      isCanResendCode = false;
      var maxDurationInSecond = _durationTimeOut.inSeconds;
      var currentDurationSecond = 0;
      durationCountdown = maxDurationInSecond;

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        currentDurationSecond++;

        if (maxDurationInSecond - currentDurationSecond >= 0) {
          durationCountdown = maxDurationInSecond - currentDurationSecond;
          emit(CountDownstarted(
              countDown: durationCountdown, canResend: isCanResendCode));
        } else {
          isCanResendCode = true;
          timer.cancel();
          emit(CountDownstarted(countDown: 0, canResend: isCanResendCode));
        }
      });
    } catch (_) {}
  }

  void cancelTimer() {
    emit(const CountDownstarted(countDown: 0, canResend: false));
    _timer.cancel();
  }
}
