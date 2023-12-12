import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/views/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      bloc: BlocProvider.of<CartCubit>(context),
      buildWhen: (previous, current) => current is! QuantityCounterLoaded,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          return ListView.builder(
            itemCount: state.cartItems.length,
            itemBuilder: (context, index) {
              final item = state.cartItems[index];
              return CartItemWidget(productItem: item);
            },
          );
        } else if (state is CartError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}