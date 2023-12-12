import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/models/populer_searches_model.dart';
import 'package:ecommerce/view_models/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopulerSearchItem extends StatelessWidget {
  final int index;
  final SearchCubit cubit;
  const PopulerSearchItem({super.key, required this.index, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: cubit,
      builder: (context, state) {
        if(state is SearchLoaded){
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                        imageUrl: state.listPopulerSearch[index].imgUrl,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.listPopulerSearch[index].title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(state.listPopulerSearch[index].description),
                      ],
                    ),
                  ],
                ),
                ...[
                  if (state.listPopulerSearch[index].type == Type.Hot)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 30,
                        width: 50,
                        color: const Color.fromARGB(255, 238, 182, 182),
                        child: const Center(
                          child: Text(
                            'Hot',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    )
                  else if (state.listPopulerSearch[index].type == Type.New)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 30,
                        width: 50,
                        color: const Color.fromARGB(255, 241, 213, 190),
                        child: const Center(
                          child: Text(
                            'New',
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ),
                    )
                  else if (state.listPopulerSearch[index].type == Type.Populer)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 30,
                        width: 80,
                        color: const Color.fromARGB(255, 186, 236, 220),
                        child: const Center(
                          child: Text(
                            'Populer',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    )
                ]
              ],
            ),
          );
        }
        else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
