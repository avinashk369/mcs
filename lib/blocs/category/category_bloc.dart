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
    on<CategoryEvent>(
      (event, emit) async {
        await event.map(
          loadCategory: (event) async => await _loadCategories(event, emit),
          swapIndex: (event) async => await _swapItems(event, emit),
        );
      },
    );
  }

  Future _swapItems(SwapIndex event, Emitter<CategoryState> emit) async {
    try {
      final curState = state;
      emit(const CategoryLoading());
      if (curState is CategorySwaped) {
        /// swaping list items here
        List<CategoryModel> categories = List.from(curState.categories);
        final temp = categories[event.last];
        categories[event.last] = categories[event.current];
        categories[event.current] = temp;
        emit(CategorySwaped(categories: categories));
      }
    } catch (e, _) {
      emit(const CategoryError(message: 'something went wrong'));
    }
  }

  Future _loadCategories(
      LoadCategory event, Emitter<CategoryState> emit) async {
    try {
      emit(const CategoryLoading());
      List<CategoryModel> categories =
          await _categoryRepositoryImpl.getCategories(event.cityId);
      categories.removeWhere((element) => element.id == '9');
      emit(CategoryLoaded(categories: categories));
      emit(CategorySwaped(categories: categories));
    } on ServerError catch (e) {
      emit(CategoryError(message: e.errorMessage));
    } catch (e) {
      emit(CategoryError(message: e.toString()));
    }
  }
}
