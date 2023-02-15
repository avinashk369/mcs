import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/server_error.dart';

import '../../models/models.dart' show CityModel;
import '../../resources/data/data_repository.dart';
part 'data_bloc.freezed.dart';
part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepositoryImpl;

  DataBloc({required this.dataRepositoryImpl})
      : super(const DataState.initial()) {
    on<LoadCities>(_loadCities);
  }

  Future _loadCities(DataEvent event, Emitter<DataState> emit) async {
    try {
      emit(const DataLoading());
      emit(CityLoaded(cities: await dataRepositoryImpl.getCities()));
    } on ServerError catch (e) {
      emit(DataError(message: e.errorMessage));
    } catch (e) {
      emit(DataError(message: e.toString()));
    }
  }
}
