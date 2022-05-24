import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
part 'test_state.dart';
part 'test_event.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitializing()) {
    on<TestEvent1>((event, emit) => test1(event, emit));
    on<TestEvent2>((event, emit) => test2(event, emit));
    on<TestEvent3>((event, emit) => test3(event, emit));
  }

  Future test1(TestEvent1 event, Emitter<TestState> emit) async {
    try {
      emit(const TestState1());
    } catch (_) {}
  }

  Future test2(TestEvent2 event, Emitter<TestState> emit) async {
    try {
      emit(TestState2(message: event.message));
    } catch (_) {}
  }

  Future test3(TestEvent3 event, Emitter<TestState> emit) async {
    try {
      emit(TestState3(check: event.check));
    } catch (_) {}
  }
}
