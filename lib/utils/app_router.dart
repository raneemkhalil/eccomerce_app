import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/product_cubit/product_details_cubit.dart';
import 'package:ecommerce/view_models/search_cubit/search_cubit.dart';
import 'package:ecommerce/views/pages/custom_bottom_navbar.dart';
import 'package:ecommerce/views/pages/my_order.dart';
import 'package:ecommerce/views/pages/product_details.dart';
import 'package:ecommerce/views/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.productDetails:
        final int index = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              final cubit = ProductDetailsCubit();
              cubit.getProductDetails(index);
              return cubit;
            },
            child: ProductDetailsPage(
              index: index,
            ),
          ),
          settings: settings,
        );
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const CustomBottomNavbar(),
          settings: settings,
        );

      case AppRoutes.searchPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_){
              final cubit = SearchCubit();
              cubit.getSearchData();
              return cubit;
            },
            child: const SearchPage(),
          ),
          settings: settings,
        );

      case AppRoutes.myOrder:
        return MaterialPageRoute(
          builder: (_) => const MyOrderPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Error Page!'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
