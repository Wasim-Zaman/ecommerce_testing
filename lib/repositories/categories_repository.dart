import 'dart:developer';

import '../models/category_model.dart';
import '../services/api_service.dart';

class CategoriesRepository {
  final ApiService _apiService;

  CategoriesRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<List<Category>> getCategories() async {
    try {
      final List<dynamic> data = await _apiService.get('products/categories');

      // Convert simple string array to Category objects
      final List<Category> categories = data.map((category) {
        return Category.fromJson(category);
      }).toList();

      return categories;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to fetch categories: $e');
    }
  }
}
