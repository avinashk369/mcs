import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/models.dart' show CategoryModel, ServerError;
import 'package:mcs/resources/category/category_repository.dart';
part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepositoryImpl;

  CategoryBloc(this._categoryRepositoryImpl)
      : super(const CategoryState.initial()) {
    on<LoadCategory>((event, emit) => _loadCategories(event, emit));
  }
  Future _loadCategories(
      LoadCategory event, Emitter<CategoryState> emit) async {
    try {
      emit(const CategoryLoading());
      List<CategoryModel> categories =
          await _categoryRepositoryImpl.getCategories(event.cityId);

      emit(CategoryLoaded(categories: categories));
    } on ServerError catch (e) {
      emit(CategoryError(message: e.errorMessage));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
