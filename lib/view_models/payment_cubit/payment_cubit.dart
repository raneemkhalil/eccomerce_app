import 'package:ecommerce/models/location_model.dart';
import 'package:ecommerce/models/payment_method_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentCubitInitial());
  void getPaymentViewData() {
    emit (PaymentLoading());
    final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    Future.delayed(const Duration (seconds: 1), () {
      emit(PaymentLoaded(cartItems: cartItems, total: subTotal + 10, locations: listOfLocations, mothodsModel: savedCards));
    });
  }

  void setLocateWithPay(int index){
    final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    LocationModel locationModel = listOfLocations[index].copyWith(isSelected: true);
    listOfLocations[index] = locationModel;
    Future.delayed(const Duration (seconds: 1), () {
      emit(PaymentLoaded(cartItems: cartItems, total: subTotal, locations: listOfLocations, mothodsModel: savedCards));
    });
  }

  void unSetLocateWithPay(int index){
    final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    LocationModel locationModel = listOfLocations[index].copyWith(isSelected: false);
    listOfLocations[index] = locationModel;
    emit(PaymentLoaded(cartItems: cartItems, total: subTotal, locations: listOfLocations, mothodsModel: savedCards));
  }
  void choosePayMethod(String payMethodId){
    emit(PaymentMethodChosen(paymentMethodId: payMethodId));
    final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
    final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
    emit(PaymentLoaded(cartItems: cartItems, total: subTotal + 10, locations: listOfLocations, mothodsModel: savedCards));  
   }
}
