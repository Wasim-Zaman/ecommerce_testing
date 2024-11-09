part of 'categories_cubit.dart';

enum CategoriesStatus { initial, loading, success, error }

class CategoriesState {
  final List<Category> categories;
  final List<Category> filteredCategories;
  final CategoriesStatus status;
  final String? error;
  final String searchQuery;

  CategoriesState({
    this.categories = const [],
    this.filteredCategories = const [],
    this.status = CategoriesStatus.initial,
    this.error,
    this.searchQuery = '',
  });

  CategoriesState copyWith({
    List<Category>? categories,
    List<Category>? filteredCategories,
    CategoriesStatus? status,
    String? error,
    String? searchQuery,
  }) {
    return CategoriesState(
      categories: categories ?? this.categories,
      filteredCategories: filteredCategories ?? this.filteredCategories,
      status: status ?? this.status,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
