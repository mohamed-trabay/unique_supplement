import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unique_supplement/core/utiles/local_storage_service.dart';
import 'package:unique_supplement/features/home/data/models/product_model/product_model.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      final favs = await LocalStorageService.loadFavorites();
      emit(FavoritesSuccess(favs));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  Future<void> addFavorite(ProductModel product) async {
    if (state is FavoritesSuccess) {
      final current = (state as FavoritesSuccess).favorites;
      final updated = [...current, product];
      await LocalStorageService.saveFavorites(updated);
      emit(FavoritesSuccess(updated));
    } else {
      await LocalStorageService.saveFavorites([product]);
      emit(FavoritesSuccess([product]));
    }
  }

  Future<void> removeFavorite(ProductModel product) async {
    if (state is FavoritesSuccess) {
      final current = (state as FavoritesSuccess).favorites;
      final updated = current.where((p) => p.id != product.id).toList();
      await LocalStorageService.saveFavorites(updated);
      emit(FavoritesSuccess(updated));
    }
  }

  bool isFavorite(ProductModel product) {
    if (state is FavoritesSuccess) {
      return (state as FavoritesSuccess).favorites.any(
        (p) => p.id == product.id,
      );
    }
    return false;
  }
}
