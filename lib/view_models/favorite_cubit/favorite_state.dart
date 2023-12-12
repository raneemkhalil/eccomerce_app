part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteLoading extends FavoriteState {}

final class QuantityCounterLoaded extends FavoriteState {
  final int value;
  final String productId;
  QuantityCounterLoaded({ required this.productId, required this.value});
}

final class FavoriteLoaded extends FavoriteState {
  final List<ProductItemModel> favoriteItems;

  FavoriteLoaded({required this.favoriteItems});
}

final class FavoriteError extends FavoriteState {
  final String message;
  FavoriteError({required this.message});
}