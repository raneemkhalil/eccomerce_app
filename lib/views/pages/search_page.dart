import 'package:ecommerce/models/last_searches_model.dart';
import 'package:ecommerce/view_models/search_cubit/search_cubit.dart';
import 'package:ecommerce/views/widgets/populer_search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchCubit>(context);
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: cubit,
      builder: (context, state) {
        if(state is SearchLoading){
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              title: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(16)),
                    prefixIcon: const Icon(Icons.search)),
              )),
            body: Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          );
        }
        if(state is SearchLoaded){
          return Scaffold(
            appBar: AppBar(
                toolbarHeight: 80,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                title: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(16)),
                      prefixIcon: const Icon(Icons.search)),
                )),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Last Search",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        TextButton(
                          child: Text(
                            "Clear All",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.listLastSearched.length,
                      gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  (maxLength(state.listLastSearched) + 1) * 14.9,
                              childAspectRatio: 5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) => ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Center(
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(lastSearches[index]),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.cancel_outlined))
                            ],
                          )
                        )
                      )
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text("Populer Search",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.listPopulerSearch.length,
                      itemBuilder: (context, index) =>
                          PopulerSearchItem(index: index, cubit: cubit)),
                  ],
                ),
              ),
            )
          );
        }
        else {
          return const SizedBox.shrink();
        }
      }
    );
  }
}
