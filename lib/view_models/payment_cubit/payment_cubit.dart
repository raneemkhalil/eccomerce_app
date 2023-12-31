import 'package:ecommerce/models/location_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentCubitInitial());
  void getPaymentViewData() {
    emit (PaymentLoading());
    final cartItems = dummyProducts.where((item) => item. isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    Future.delayed(const Duration (seconds: 1), () {
      emit(PaymentLoaded(cartItems: cartItems, total: subTotal + 10));
    });
  }

  void getLocateWithPay(LocationModel locationModel){
    final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    emit(PaymentLoaded(cartItems: cartItems, total: subTotal, selectedLocation: locationModel));
  }
}
