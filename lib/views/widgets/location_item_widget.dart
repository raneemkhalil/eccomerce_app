import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:ecommerce/view_models/location_cubit/location_cubit.dart';
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
    final cubit = BlocProvider.of<LocationCubit>(context);
    return BlocBuilder<LocationCubit, LocationState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is LocationSelected,
      builder: (context, state) {
        if (state is LocationSelected) {
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 12.0,
            ),
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: state.selected
                          ? Theme.of(context).primaryColor
                          : Colors.grey),
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
                            state.location.cityName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            '${state.location.cityName}, ${state.location.countryName}',
                            style: const TextStyle(color: AppColors.grey),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: state.selected
                            ? Theme.of(context).primaryColor
                            : AppColors.grey,
                        radius: 38,
                        child: CachedNetworkImage(
                          imageUrl: state.location.imgUrl,
                          height: 70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                cubit.selectLocation(widget.index);
                final cubitPay = PaymentCubit();
                cubitPay.getLocateWithPay(state.location);
                Navigator.of(context).pushNamed(AppRoutes.payment);
                // Navigator.of(context).pop(state.location);
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
