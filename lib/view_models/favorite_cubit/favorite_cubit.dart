import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  void getFavoriteItems() {
    emit(FavoriteLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(FavoriteLoaded(
          favoriteItems: dummyProducts
              .where((item) => item.isFavorite == true)
              .toList()));
    });
  }

  void removeFromFavorite(String productId) {
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isFavorite: false,
    );
    emit(FavoriteLoaded(
      favoriteItems:
          dummyProducts.where((item) => item.isFavorite == true).toList(),
    ));
  }
}