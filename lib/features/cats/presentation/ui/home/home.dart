import 'package:cats_ca/features/cats/presentation/widget/custom_bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/app_bar.dart';
import '../../widget/drawer.dart';

class Home extends StatefulWidget {
  final String location;
  final Widget child;
  const Home({super.key, required this.location, required this.child});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: SafeArea(child: widget.child),
      bottomNavigationBar: _buildBottomNav(),
      drawer: _buildDrawer(),
    );
  }

  _buildAppbar() {
    return catsAppBar();
  }

  _buildDrawer() {
    return const CatsDrawer();
  }

  _buildBottomNav() {
    return BottomNavigationBar(
      onTap: (value) {
        goOtherTab(context, value);
      },
      items: tabs,
      currentIndex: widget.location == '/'
          ? 0
          : widget.location == '/favourite'
              ? 1
              : widget.location == '/categories'
                  ? 2
                  : 3,
    );
  }

  static const List<CustomBottomNavItem> tabs = [
    CustomBottomNavItem(
      icon: Icon(Icons.home),
      label: 'Home',
      initialLocation: '/',
    ),
    CustomBottomNavItem(
      icon: Icon(Icons.favorite),
      label: 'Favourite cats',
      initialLocation: '/favourite',
    ),
    CustomBottomNavItem(
      icon: Icon(Icons.category),
      label: 'Categories',
      initialLocation: '/categories',
    ),
  ];
  void goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = tabs[index].initialLocation;

    setState(() {
      _currentIndex = index;
    });
    router.go(location);
    // if (index == 3) {
    //   context.push('/login');
    // } else {
    //   router.go(location);
    // }
  }
}
