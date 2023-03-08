import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'test_mixin.dart';
part 'test_state.dart';
part 'test_event.dart';
part 'test_bloc.freezed.dart';

class TestBloc extends Bloc<TestEvent, TestState> with TestMixin {
  TestBloc() : super(const TestInitializing()) {
    on<TestEvent1>((event, emit) => test1(event, emit));
    // on<TestEvent2>((event, emit) => test2(event, emit));
    // on<TestEvent3>((event, emit) => test3(event, emit));
  }

  Future test1(TestEvent1 event, Emitter<TestState> emit) async {
    try {
      emit(const TestState2(message: 'Test bloc 1'));
    } catch (_) {}
  }
}

class TestBloc2 extends Bloc<TestEvent, TestState> with TestMixin {
  TestBloc2() : super(const TestInitializing()) {
    on<TestEvent1>(test1);
  }

  Future test1(TestEvent1 event, Emitter<TestState> emit) async {
    try {
      emit(const TestState2(message: 'Test bloc 2'));
    } catch (_) {}
  }
}

class TestBloc3 extends Bloc<TestEvent, TestState> with TestMixin {
  TestBloc3() : super(const TestInitializing()) {
    on<TestEvent1>(test1);
  }

  Future test1(TestEvent1 event, Emitter<TestState> emit) async {
    try {
      emit(const TestState2(message: 'Test bloc 3'));
    } catch (_) {}
  }
}
