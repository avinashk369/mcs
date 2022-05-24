part of 'test_bloc.dart';

@immutable
abstract class TestState extends Equatable {
  const TestState();
}

class TestInitializing extends TestState {
  @override
  List<Object> get props => [];
}

class TestState1 extends TestState {
  const TestState1();
  @override
  List<Object?> get props => [];
}

class TestState2 extends TestState {
  final String message;
  const TestState2({
    required this.message,
  });
  @override
  List<Object> get props => [message];
}

class TestState3 extends TestState {
  final bool check;
  const TestState3({
    required this.check,
  });
  @override
  List<Object> get props => [check];
}
