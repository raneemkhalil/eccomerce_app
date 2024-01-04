import 'package:ecommerce/models/payment_method_model.dart';
import 'package:ecommerce/view_models/payment_cubit/payment_cubit.dart';
import 'package:ecommerce/views/widgets/payment_method_item%20_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodWidget extends StatelessWidget {
  
  const PaymentMethodWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentCubit>(context);
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text('Payment Method', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
            )),
          ),
          BlocBuilder<PaymentCubit, PaymentState>(
            bloc: cubit,
            buildWhen: (previous, current) => current is PaymentLoaded || current is PaymentMethodChosen,
            builder: (context, state) {
              if(state is PaymentLoaded){
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => PaymentMethodItemWidget(
                    paymentMethod: savedCards[index], 
                  )
                );
              }
              else{
                return const SizedBox.shrink();
              }
            },
          ),
          ListTile(
            leading: const SizedBox(
              child: Icon(Icons.add),
            ),
            title: const Text('Add Payment Method'),
            onTap: () {
              
            },
          ),
        ],
      ),
    );
  }
}
