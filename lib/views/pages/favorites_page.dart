import 'package:ecommerce/models/category_item_model.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:ecommerce/view_models/favorite_cubit/favorite_cubit.dart';
import 'package:ecommerce/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late FavoriteCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<FavoriteCubit>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.circular(16)),
                hintText: 'Search somthing...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.filter_list),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listOfCategorys.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.grey),
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              listOfCategorys[index].label,
                              style: const TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
          BlocBuilder<FavoriteCubit, FavoriteState>(
            buildWhen: (previous, current){
              return current is FavoriteLoaded;
            },
            bloc: cubit,
            builder: (context, state) {
              if(state is FavoriteLoading){
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              else if(state is FavoriteLoaded){
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.favoriteItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: .98),
                  itemBuilder: (context, index) => ProductItem(
                    productItem: state.favoriteItems[index], cubit: cubit,
                  ),
                );
              }
              else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
