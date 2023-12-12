part of 'product_details_cubit.dart';

class ProductDetailsState {
  const ProductDetailsState();
}

final class ProductDetailsInitial extends ProductDetailsState {
  const ProductDetailsInitial();
}

final class ProductDetailsLoading extends ProductDetailsState {
  const ProductDetailsLoading();
}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductItemModel productItem;

  ProductDetailsLoaded({required this.productItem});
}

final class ProductDetailsError extends ProductDetailsState {
  final String message;

  const ProductDetailsError({required this.message});
}