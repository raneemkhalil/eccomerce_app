import 'package:ecommerce/models/product_item_model.dart';
import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:ecommerce/view_models/payment_cubit/payment_cubit.dart';
import 'package:ecommerce/views/widgets/clickable_box_widget.dart';
import 'package:ecommerce/views/widgets/product_item_payment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<PaymentCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: BlocBuilder<PaymentCubit, PaymentState>(
        bloc: cubit,
        buildWhen: (previous, current) => current is PaymentLoaded,
        builder: (context, state) {
          if (state is PaymentLoading){
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          else if (state is PaymentLoaded){
            final size = MediaQuery.of(context).size;
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      buildInlineHeadlines(
                        context: context,
                        title: 'Address',
                        onTap: (){}
                      ),
                      const SizedBox (height: 8.0),
                      if(state.selectedLocation != null)
                        ClickableBoxWidget(label: state.selectedLocation!.cityName, onTap: () => Navigator.of(context).pushNamed(AppRoutes.locationPage),)
                      else
                        ClickableBoxWidget(
                          label: "Add Address", 
                          onTap: () async {
                            await Navigator.of(context).pushNamed(AppRoutes.locationPage);
                            cubit.getLocateWithPay(state.selectedLocation!);
                          },
                        ),
                      const SizedBox (height: 10.0),
                      buildInlineHeadlines(
                        context: context, 
                        title: 'Products',
                        productsNumbers: state.cartItems.length
                      ),
                      const SizedBox(height: 8.0),
                      ListView.builder(
                        itemCount: state.cartItems.length, 
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics (),
                        itemBuilder: (context, index) {
                          final ProductItemModel item = state.cartItems[index];
                          return ProductItemPaymentWidget(item: item);
                        }
                      ),
                      const SizedBox(height: 8.0),
                      buildInlineHeadlines(
                        context: context, 
                        title: 'Payment Method'
                      ),
                      const SizedBox(height: 20.0),
                      const ClickableBoxWidget(label: 'Add Payment Method'),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Amount', style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: AppColors.grey
                          ),),
                          Text('\$${state.total}', style: Theme.of(context).textTheme.labelLarge,)
                        ],
                      ),
                      const SizedBox (height: 34.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                        child: SizedBox(
                          width: double.infinity, 
                          height: 50, 
                          child: ElevatedButton( 
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor, 
                              foregroundColor: AppColors.white,
                            ),
                            child: const Text ('Checkout Now'),
                          )
                        ),
                      ),
                      const SizedBox(height: 34.0,)
                    ]
                  ),
                )
              ),
            ); 
          }
          else if (state is PaymentError){
            return Center(child: Text(state.message),);
          }
          else {
            return const Center(child: Text('Something went wrong!'),);
          }
        }
      )
    );
  }
  Widget buildInlineHeadlines({
    required BuildContext context,
    required String title,
    int? productsNumbers, 
    VoidCallback? onTap
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
        Row(
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium,), 
            if (productsNumbers != null) Text('($productsNumbers)', style: Theme.of(context).textTheme.headlineSmall,),
          ]
        ),
        if (onTap!= null)
          TextButton(
            onPressed: onTap, 
            child: Text(
              'Edit',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
      ]
    ); 
  }
}