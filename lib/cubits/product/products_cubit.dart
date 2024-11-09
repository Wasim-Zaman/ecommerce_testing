import 'package:ecommerce_testing/models/product_model.dart';
import 'package:ecommerce_testing/repositories/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository _repository;

  ProductsCubit({ProductsRepository? repository})
      : _repository = repository ?? ProductsRepository(),
        super(ProductsState());

  Future<void> fetchProducts() async {
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      final products = await _repository.getProducts();
      emit(state.copyWith(
        status: ProductsStatus.success,
        products: products,
        filteredProducts: products,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.error,
        error: e.toString(),
      ));
    }
  }

  Future<void> searchProducts(String query) async {
    emit(state.copyWith(
      searchQuery: query,
      status: ProductsStatus.loading,
    ));

    try {
      if (query.isEmpty) {
        emit(state.copyWith(
          status: ProductsStatus.success,
          filteredProducts: state.products,
        ));
        return;
      }

      // Local search first
      final localResults = state.products.where((product) {
        return product.title.toLowerCase().contains(query.toLowerCase()) ||
            product.brand.toLowerCase().contains(query.toLowerCase());
      }).toList();

      if (localResults.isNotEmpty) {
        emit(state.copyWith(
          status: ProductsStatus.success,
          filteredProducts: localResults,
        ));
        return;
      }

      // If no local results, fetch from API
      final products = await _repository.searchProducts(query);
      emit(state.copyWith(
        status: ProductsStatus.success,
        filteredProducts: products,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.error,
        error: e.toString(),
      ));
    }
  }

  Future<void> fetchProductsByCategory(String category) async {
    emit(state.copyWith(status: ProductsStatus.loading));

    try {
      if (state.products.isEmpty) {
        // If products haven't been loaded yet, fetch them first
        final products = await _repository.getProducts();
        final filteredProducts = products
            .where((product) =>
                product.category.toLowerCase() == category.toLowerCase())
            .toList();

        emit(state.copyWith(
          status: ProductsStatus.success,
          products: products,
          filteredProducts: filteredProducts,
        ));
      } else {
        // Filter existing products
        final filteredProducts = state.products
            .where((product) =>
                product.category.toLowerCase() == category.toLowerCase())
            .toList();

        emit(state.copyWith(
          status: ProductsStatus.success,
          filteredProducts: filteredProducts,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        status: ProductsStatus.error,
        error: e.toString(),
      ));
    }
  }
}
