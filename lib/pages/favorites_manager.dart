import 'package:flutter/material.dart';

class FavoritesManager {
  /// Ensemble d'IDs de destinations mises en favoris.
  static final ValueNotifier<Set<String>> favoriteIds =
      ValueNotifier<Set<String>>(<String>{});

  static bool isFavorite(String id) => favoriteIds.value.contains(id);

  static void addFavorite(String id) {
    final newSet = Set<String>.from(favoriteIds.value)..add(id);
    favoriteIds.value = newSet;
  }

  static void removeFavorite(String id) {
    final newSet = Set<String>.from(favoriteIds.value)..remove(id);
    favoriteIds.value = newSet;
  }

  static void toggleFavorite(String id) {
    final current = favoriteIds.value;
    final newSet = Set<String>.from(current);
    if (newSet.contains(id)) {
      newSet.remove(id);
    } else {
      newSet.add(id);
    }
    favoriteIds.value = newSet;
  }

  /// Retire plusieurs favoris d'un coup.
  static void removeMany(Iterable<String> ids) {
    final newSet = Set<String>.from(favoriteIds.value)..removeAll(ids);
    favoriteIds.value = newSet;
  }

  /// Vide complètement la liste de favoris.
  static void clearFavorites() {
    favoriteIds.value = <String>{};
  }
}
