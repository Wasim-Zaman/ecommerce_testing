part of 'favorites_cubit.dart';

class FavoritesState {
  final List<Product> favorites;
  final List<Product> filteredFavorites;

  FavoritesState({
    List<Product>? favorites,
    List<Product>? filteredFavorites,
  })  : favorites = favorites ?? [],
        filteredFavorites = filteredFavorites ?? [];

  FavoritesState copyWith({
    List<Product>? favorites,
    List<Product>? filteredFavorites,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      filteredFavorites: filteredFavorites ?? this.filteredFavorites,
    );
  }
}
