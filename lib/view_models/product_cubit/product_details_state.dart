part of 'product_details_cubit.dart';

class ProductDetailsState {
  final int quantity;

  const ProductDetailsState({required this.quantity});
}

final class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial() : super(quantity: 1);
}

final class ProductDetailsLoading extends ProductDetailsState {
  const ProductDetailsLoading() : super(quantity: 1);
}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel productItem;

  ProductDetailsLoaded({required this.productItem}) : super(quantity: 1);
}

final class ProductDetailsError extends ProductDetailsState {
  final String message;

  const ProductDetailsError({required this.message}) : super(quantity: 1);
}