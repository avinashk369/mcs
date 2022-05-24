part of 'test_bloc.dart';

@immutable
abstract class TestEvent extends Equatable {
  const TestEvent();
}

class TestEvent1 extends TestEvent {
  const TestEvent1();
  @override
  List<Object> get props => [];
}

class TestEvent2 extends TestEvent {
  final String message;
  const TestEvent2(this.message);
  @override
  List<Object> get props => [message];
}

class TestEvent3 extends TestEvent {
  final bool check;
  const TestEvent3(this.check);
  @override
  List<Object> get props => [check];
}
