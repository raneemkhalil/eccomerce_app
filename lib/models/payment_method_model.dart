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

List<PaymentMethodModel> savedCards = [
  PaymentMethodModel(id: '1', cardNumber: '4568987543278432', cardHolderName: 'Raneem Khalil', expiryDate: '01/28', cvvCode: '375'),
  PaymentMethodModel(id: '2', cardNumber: '4568967543273432', cardHolderName: 'Rahaf Khalil', expiryDate: '01/25', cvvCode: '388'),
  PaymentMethodModel(id: '3', cardNumber: '4568887543274432', cardHolderName: 'Samer Khalil', expiryDate: '01/26', cvvCode: '283')
];
