part of 'payment_cubit.dart';

class PaymentState {}

final class PaymentCubitInitial extends PaymentState {}

final class PaymentLoading extends PaymentState {}

final class PaymentLoaded extends PaymentState {
  final List<ProductItemModel> cartItems;
  final double total;
  final List<LocationModel> locations;
  final List<PaymentMethodModel> mothodsModel;

  PaymentLoaded ({
    required this.cartItems,
    required this.total,
    required this.locations,
    required this.mothodsModel
  });
}

final class PaymentError extends PaymentState {
  final String message;
  PaymentError ({
    required this. message,
  });
}

final class PaymentMethodChosen extends PaymentState {
  final String paymentMethodId;
  PaymentMethodChosen ({required this.paymentMethodId});
}