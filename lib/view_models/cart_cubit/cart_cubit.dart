import 'package:ecommerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void getCartItems() {
    emit(CartLoading());
    final cartItem = dummyProducts
            .where((item) => item.isAddedToCart == true)
            .toList();
    final subTotal = cartItem.fold<double>(0, (sum, item) => sum + item.price);
    Future.delayed(const Duration(seconds: 1), () {
      emit(CartLoaded(
          cartItems: cartItem,
          subTotal: subTotal
        ));
    });
  }

  void removeFromCart(String productId) {
    emit(CartLoading());
    final index = dummyProducts.indexWhere((item) => item.id == productId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      isAddedToCart: false,
    );
    Future.delayed(const Duration(seconds: 1), () {
      final cartItems = dummyProducts.where((item) => item.isAddedToCart == true).toList();
      final subTotal = cartItems.fold<double>(0, (sum, item) => sum + item.price);
      emit(CartLoaded(
        cartItems: cartItems,
        subTotal: subTotal
      ));
    });
  }

  void increment(String prodcutId) {
    final index = dummyProducts.indexWhere((item) => item.id == prodcutId);
    dummyProducts[index] = dummyProducts[index].copyWith(
      quantity: dummyProducts[index].quantity + 1,
    );
    emit(
      QuantityCounterLoaded(
        value: dummyProducts[index].quantity,
        productId: prodcutId,
      ),
    );
  }

  void decrement(String prodcutId) {
    final index = dummyProducts.indexWhere((item) => item.id == prodcutId);
    int quantity = dummyProducts[index].quantity;
    if(quantity > 1){
      dummyProducts[index] = dummyProducts[index].copyWith(quantity: quantity - 1);
      emit(
        QuantityCounterLoaded(
          value: dummyProducts[index].quantity,
          productId: prodcutId,
        ),
      );
    }
    
  }
}