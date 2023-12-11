import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: BlocProvider.of<HomeCubit>(context),
      builder: (context, state){
        if(state is HomeLoaded){
          return Center(
            child: GridView.builder(
              itemCount: state.categoryItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 2.2
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: (){},
                child: CategoryItem(categoryItem: state.categoryItems[index], index: index),
              )
            )
          );
        }
        else {
          return const SizedBox.shrink();
        }
      }
    );
  }
}