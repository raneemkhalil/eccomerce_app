import 'package:ecommerce/view_models/product_cubit/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsPage extends StatefulWidget {
  final int index;
  const ProductDetailsPage({super.key, required this.index});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // int quantity = 1;

  // void _decreaseQuantity() {
  //   setState(() {
  //     if (quantity > 1) {
  //       quantity -= 1;
  //     }
  //   });
  // }

  // void _increaseQuantity() {
  //   setState(
  //     () => quantity += 1,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ProductDetailsCubit>(context);
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      bloc: cubit,
      buildWhen: (previous, current) => current is ProductDetailsLoaded,
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Center(child: Text('Product Details')),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
              ],
            ),
            body: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        } else if (state is ProductDetailsError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is ProductDetailsLoaded) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Center(child: Text('Product Details')),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
              ],
            ),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(children: [
                      Container(
                        height: 550,
                        width: 430,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://www.seasaltcornwall.com/media/catalog/product/b/_/b_wm23525_29623_2.jpg?optimize=medium&bg-color=255,255,255&fit=bounds&height=795&width=530&canvas=530:795'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 520),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40)),
                          child: Container(
                            width: 430,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            state.productItem.name,
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            state.productItem.category,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0),
                                          ),
                                        ],
                                      ),
                                      DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(24.0),
                                        ),
                                        child: Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                cubit.decrement(widget.index);
                                              },
                                              icon:
                                                  const Icon(Icons.remove),
                                            ),
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            Text(state.productItem.quantity.toString()),
                                            const SizedBox(
                                              width: 4.0,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                cubit.increment(widget.index);
                                              },
                                              icon: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 22),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Size',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'large',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 22),
                                  child: ReadMoreText(
                                    colorClickableText:
                                        Theme.of(context).primaryColor,
                                    trimCollapsedText: 'Show more',
                                    trimExpandedText: 'Show less',
                                    trimLines: 3,
                                    trimMode: TrimMode.Line,
                                    state.productItem.description,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                      start: 30,
                      end: 30,
                      bottom: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                '\$ ',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                ' ${(state.productItem.price * 1).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(32),
                          child: SizedBox(
                            height: 55,
                            width: 190,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.shopping_bag_outlined),
                                  Text('Add to cart'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
