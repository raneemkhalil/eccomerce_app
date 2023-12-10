import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/utils/colors_app.dart';
import 'package:ecommerce/views/widgets/category_tab_view.dart';
import 'package:ecommerce/views/widgets/home_tab_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://www.shorouknews.com/uploadedimages/Other/original/2023-11-2018_46_53.119381-qdffe-980x980.jpg'),
                      ),
                      const SizedBox(width: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Raneem',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Let\'s go shopping',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.searchPage),
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TabBar(
                controller: _tabController,
                unselectedLabelColor: AppColors.grey,
                tabs: const [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Category',
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HomeTabView(),
                    CategoryTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}