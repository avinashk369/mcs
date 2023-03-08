part of 'test_bloc.dart';

@freezed
class TestState with _$TestState {
  const factory TestState.initial() = TestInitializing;
  const factory TestState.testState1() = TestState1;
  const factory TestState.testState2({required String message}) = TestState2;
  const factory TestState.testState3({required bool check}) = TestState3;
}
