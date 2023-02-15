import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/server_error.dart';
import 'package:mcs/models/category/category_model.dart';
import 'package:mcs/models/subcat/subcat_model.dart';
import 'package:mcs/resources/category/category_repository.dart';
part 'category_bloc.freezed.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepositoryImpl;

  CategoryBloc(this._categoryRepositoryImpl)
      : super(const CategoryState.initial()) {
    on<LoadCategory>((event, emit) => _loadCategories(event, emit));
    on<LoadSubcategory>((event, emit) => _loadSubcategories(event, emit));
  }
  Future _loadCategories(
      LoadCategory event, Emitter<CategoryState> emit) async {
    try {
      //await Future.delayed(const Duration(seconds: 5), () {});
      List<CategoryModel> categories =
          await _categoryRepositoryImpl.getCategories();

      emit(CategoryLoaded(categories: categories));
    } on ServerError catch (e) {
      emit(CategoryError(message: e.errorMessage));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }

  Future _loadSubcategories(
      LoadSubcategory event, Emitter<CategoryState> emit) async {
    try {
      // await Future.delayed(const Duration(seconds: 5), () {});
      List<SubcatModel> subcats =
          await _categoryRepositoryImpl.getSubCategories(event.catId);

      emit(SubcatLoaded(subcats: subcats));
    } on ServerError catch (e) {
      emit(CategoryError(message: e.errorMessage));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
