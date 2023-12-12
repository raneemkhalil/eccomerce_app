import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/home_carousel_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/models/category_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(
        HomeLoaded(
          products: dummyProducts,
          carouselItems: dummyCarouselItems,
          categoryItems: listOfCategorys,
        ),
      );
    });
  }
  bool changeFavorite(String prodcutId){
    int index = dummyProducts.indexWhere((element) => element.id == prodcutId,);
    dummyProducts[index] = dummyProducts[index].copyWith(isFavorite: !dummyProducts[index].isFavorite);
    emit(
      HomeLoaded(
        products: dummyProducts,
        carouselItems: dummyCarouselItems,
        categoryItems: listOfCategorys,
      ),
    );
    return dummyProducts[index].isFavorite;
  }
}