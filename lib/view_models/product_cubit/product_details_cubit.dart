import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/product_item_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsInitial());
  void getProductDetails(int index) {
    emit(const ProductDetailsLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        ProductDetailsLoaded(
          productItem: dummyProducts[index],
        ),
      );
    });
  }

  void increment(int index){
    int quantity = dummyProducts[index].quantity + 1;
    double price = dummyProducts[index].price * quantity;

    dummyProducts[index] = dummyProducts[index].copyWith(quantity: quantity, price: price);
    emit(ProductDetailsLoaded(productItem: dummyProducts[index]));
  }

  void decrement(int index) {
    int quantity = dummyProducts[index].quantity;
    double price = dummyProducts[index].price / quantity;
    quantity = quantity - 1;

    if (quantity >= 1) {
      dummyProducts[index] = dummyProducts[index].copyWith(quantity: quantity, price: price);
      emit(ProductDetailsLoaded(productItem: dummyProducts[index]));
    }
  }
}
