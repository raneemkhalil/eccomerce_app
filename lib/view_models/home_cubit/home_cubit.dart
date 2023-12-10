import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/home_carousel_model.dart';
import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/models/category_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        HomeLoaded(
          products: dummyProducts,
          carouselItems: dummyCarouselItems,
          categoryItems: categoryItems,
        ),
      );
    });
  }
}