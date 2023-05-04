import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mcs/models/category/subcat_model.dart';
import 'package:mcs/resources/category/category_repository.dart';

import '../../models/server_error.dart';
part 'subcat_bloc.freezed.dart';
part 'subcat_event.dart';
part 'subcate_state.dart';

class SubcatBloc extends Bloc<SubcatEvent, SubcatState> {
  final CategoryRepository _categoryRepositoryImpl;
  SubcatBloc(this._categoryRepositoryImpl) : super(const SubcatInitializing()) {
    on<SubcatEvent>((event, emit) async {
      await event.map(
        loadsubcat: (event) async => await _loadSubcategories(event, emit),
      );
    });
  }
  Future _loadSubcategories(LoadSubcat event, Emitter<SubcatState> emit) async {
    try {
      emit(const SubcatLoading());
      final state = this.state;
      List<SubCateModel> subcats = await _categoryRepositoryImpl
          .getSubCategories(event.cityId, event.catId);
      if (state is SubcatLoaded) {
        emit(state.copyWith(subcats: subcats));
      }
      emit(SubcatLoaded(subcats: subcats, catName: event.catName));
    } on ServerError catch (e) {
      emit(SubcatError(message: e.errorMessage));
    } catch (e) {
      emit(SubcatError(message: e.toString()));
    }
  }
}
