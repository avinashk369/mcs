part of 'test_bloc.dart';

@freezed
class TestEvent with _$TestEvent {
  const factory TestEvent.event1() = TestEvent1;
  const factory TestEvent.event2({String? message}) = TestEvent2;
  const factory TestEvent.event3({bool? check}) = TestEvent3;
}
