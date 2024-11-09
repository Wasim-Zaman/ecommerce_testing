import 'package:ecommerce_testing/services/api_service.dart';

import '../models/product_model.dart';

class ProductsRepository {
  final ApiService _apiService;

  ProductsRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  Future<List<Product>> getProducts() async {
    try {
      final data = await _apiService.get('products?limit=100');

      final List<Product> products = (data['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      final data = await _apiService.get('products/search?q=$query');

      final List<Product> products = (data['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList();

      return products;
    } catch (e) {
      throw Exception('Failed to search products: $e');
    }
  }
}
