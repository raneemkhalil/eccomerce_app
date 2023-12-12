import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final dynamic cubit;
  final int value;
  final ProductItemModel productItem;
  const CounterWidget({super.key, required this.cubit, required this.value, required this.productItem});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.white,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => cubit.decrement(productItem.id),
            icon: const Icon(Icons.remove),
          ),
          Text('$value'),
          IconButton(
            onPressed: () => cubit.increment(productItem.id),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}