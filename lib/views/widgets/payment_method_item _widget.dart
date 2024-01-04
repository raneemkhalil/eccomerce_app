import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/payment_method_model.dart';
import 'package:ecommerce/view_models/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  final PaymentMethodModel? paymentMethod;
  const PaymentMethodItemWidget({super.key, this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentCubit>(context);
    return SizedBox(
      height: 80,
      child: Center(
        child: BlocBuilder<PaymentCubit, PaymentState>(
            buildWhen: (previous, current) => current is PaymentMethodChosen,
            bloc: cubit,
            builder: (context, state) {
            return ListTile(
              leading: SizedBox(
                  width: 80,
                  child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl:
                          'https://seeklogo.com/images/M/Master_Card-logo-027CB51F96-seeklogo.com.png')),
              title: const Text('Mastercard'),
              subtitle: Text(paymentMethod!.cardNumber),
              onTap: () {
                cubit.choosePayMethod(paymentMethod!.id);
              },
              trailing: Radio<String>(
                value: paymentMethod!.id,
                groupValue: state is PaymentMethodChosen
                    ? state.paymentMethodId
                    : null,
                onChanged: (value) => cubit.choosePayMethod(value!),
              ),
            );
          },
        ),
      ),
    );
  }
}
