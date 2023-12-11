import 'package:ecommerce/utils/app_routes.dart';
import 'package:ecommerce/view_models/home_cubit/home_cubit.dart';
import 'package:ecommerce/views/pages/cart_page.dart';
import 'package:ecommerce/views/pages/favorites_page.dart';
import 'package:ecommerce/views/pages/home_page.dart';
import 'package:ecommerce/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CustomBottomNavbar extends StatefulWidget {
  const CustomBottomNavbar({super.key, String? title});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _controller.addListener(() {
      setState(() {
        currentIndex = _controller.index;
      });
    });
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) {
          final cubit = HomeCubit();
          cubit.getHomeData();
          return cubit;
        },
        child: const HomePage(),
      ),
      const CartPage(),
      const FavoritesPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ('Home'),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ('Cart'),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: ('Favorites'),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ('Profile'),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start:12.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
               'https://www.shorouknews.com/uploadedimages/Other/original/2023-11-2018_46_53.119381-qdffe-980x980.jpg'
            )
          ),
        ),
        title: Column(
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
        actions: [
          if(currentIndex == 0) ...[
            IconButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.searchPage),
            icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none),
            )
          ],
          if(currentIndex == 1)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextButton.icon(
                icon: const Icon(Icons.shopping_bag),
                label: const Text("My Orders"),
                onPressed: (){
                  Navigator.of(context).pushNamed(AppRoutes.myOrder);
                },
              ),
            )
        ],
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
      ),
    );
  }
}