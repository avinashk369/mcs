part of 'timer_bloc.dart';

@freezed
class TimerState with _$TimerState {
  const factory TimerState.initial() = TimerInitializing;
  const factory TimerState.countDownStrated(
      {required int countDown, required bool canResend}) = CountDownstarted;
}
