import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:ecommerce/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationItemWidget extends StatefulWidget {
  final int index;
  const LocationItemWidget({super.key, required this.index});

  @override
  State<LocationItemWidget> createState() => _LocationItemWidgetState();
}

class _LocationItemWidgetState extends State<LocationItemWidget> {
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentCubit>(context);
    return BlocBuilder<PaymentCubit, PaymentState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is PaymentLoaded,
      builder: (context, state) {
        print(state);
        if (state is PaymentLoaded) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 12.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: state.locations[widget.index].isSelected
                        ? AppColors.primaryColor
                        : AppColors.grey),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.locations[widget.index].cityName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${state.locations[widget.index].cityName}, ${state.locations[widget.index].countryName}',
                          style: const TextStyle(color: AppColors.grey),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: state.locations[widget.index].isSelected
                          ? AppColors.primaryColor
                          : AppColors.grey,
                      radius: 38,
                      child: CachedNetworkImage(
                        imageUrl: state.locations[widget.index].imgUrl,
                        height: 70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
