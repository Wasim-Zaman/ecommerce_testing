import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesState());

  void toggleFavorite(Product product) {
    final List<Product> updatedFavorites = List.from(state.favorites);

    if (isFavorite(product)) {
      updatedFavorites.removeWhere((p) => p.id == product.id);
    } else {
      updatedFavorites.add(product);
    }

    emit(state.copyWith(
      favorites: updatedFavorites,
      filteredFavorites: updatedFavorites,
    ));
  }

  bool isFavorite(Product product) {
    return state.favorites.any((p) => p.id == product.id);
  }

  void searchFavorites(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(filteredFavorites: state.favorites));
      return;
    }

    final filteredList = state.favorites.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase()) ||
          product.brand.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(filteredFavorites: filteredList));
  }
}
