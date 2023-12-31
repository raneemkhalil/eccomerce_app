import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:ecommerce/view_models/cart_cubit/cart_cubit.dart';
import 'package:ecommerce/views/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dash/flutter_dash.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartState>(
      bloc: BlocProvider.of<CartCubit>(context),
      buildWhen: (previous, current) => current is! QuantityCounterLoaded,
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is CartLoaded) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return CartItemWidget(productItem: item);
                    },
                  ),
                  const SizedBox(height: 24,),
                  buildTotalAndSubtotalItem(context, 'Subtotal', state.subTotal),
                  const SizedBox(height: 8,),
                  buildTotalAndSubtotalItem(context, 'Shipping', 10),
                  const SizedBox(height: 10,),
                  Dash(
                    length: size.width/1.1,
                    dashColor: Theme.of(context).dividerColor,
                  ),
                  const SizedBox(height: 10,),
                  buildTotalAndSubtotalItem(context, 'Total', state.subTotal + 10),
                  const SizedBox(height: 26,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.payment),
                        child: const Text('Check Out')
                      ),
                    ),
                  )
                ],
              ),
            ),
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
  Widget buildTotalAndSubtotalItem(BuildContext context, String title, double value){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: AppColors.grey
            ),
            
          ),
          Text(
            '\$$value',
            style: Theme.of(context).textTheme.labelLarge,
          )
        ],
      ),
    );
  }
}