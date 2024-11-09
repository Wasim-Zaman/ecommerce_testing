part of 'products_cubit.dart';

enum ProductsStatus { initial, loading, success, error }

class ProductsState {
  final List<Product> products;
  final List<Product> filteredProducts;
  final ProductsStatus status;
  final String? error;
  final String searchQuery;

  ProductsState({
    this.products = const [],
    this.filteredProducts = const [],
    this.status = ProductsStatus.initial,
    this.error,
    this.searchQuery = '',
  });

  ProductsState copyWith({
    List<Product>? products,
    List<Product>? filteredProducts,
    ProductsStatus? status,
    String? error,
    String? searchQuery,
  }) {
    return ProductsState(
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      status: status ?? this.status,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
