class PaymentMethodModel {
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvvCode;

  PaymentMethodModel({
    required this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvvCode,
  }) ;
}
