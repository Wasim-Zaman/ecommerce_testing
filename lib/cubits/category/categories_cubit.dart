import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/category_model.dart';
import '../../repositories/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepository _repository;

  CategoriesCubit({CategoriesRepository? repository})
      : _repository = repository ?? CategoriesRepository(),
        super(CategoriesState());

  Future<void> fetchCategories() async {
    emit(state.copyWith(status: CategoriesStatus.loading));

    try {
      final categories = await _repository.getCategories();
      emit(state.copyWith(
        status: CategoriesStatus.success,
        categories: categories,
        filteredCategories: categories,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: CategoriesStatus.error,
        error: e.toString(),
      ));
    }
  }

  void searchCategories(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(
        filteredCategories: state.categories,
        searchQuery: query,
      ));
      return;
    }

    final filteredCategories = state.categories.where((category) {
      return category.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(
      filteredCategories: filteredCategories,
      searchQuery: query,
    ));
  }
}
