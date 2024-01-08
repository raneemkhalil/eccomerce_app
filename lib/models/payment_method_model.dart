class PaymentMethodModel {
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final String cvvCode;
  final String imgUrl;
  final String name;

  PaymentMethodModel({
    required this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.cvvCode,
    this.imgUrl =
        'https://images.fastcompany.net/image/upload/w_1200,c_limit,q_auto:best/wp-cms/uploads/2023/04/i-3-90885664-mastercard-logo.jpg',
    this.name = 'Master Card',
  });
}

List<PaymentMethodModel> savedCards = [
  PaymentMethodModel(
    id: '1',
    cardNumber: '5555-6666-7777',
    cardHolderName: "John Doe",
    expiryDate: '02/23',
    cvvCode: '894',
  ),
  PaymentMethodModel(
    id: '2',
    cardNumber: '1111-2222-3333',
    cardHolderName: "Jane Smith",
    expiryDate: '05/25',
    cvvCode: '123',
  ),
  PaymentMethodModel(
    id: '3',
    cardNumber: '9999-0000-1111',
    cardHolderName: "Rami yacoub",
    expiryDate: '01/22',
    cvvCode: '332',
  ),
];