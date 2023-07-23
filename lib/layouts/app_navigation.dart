import 'package:flaru/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  List<NavigationItems> items = [
    NavigationItems(
        routerName: RouteNames.explorer.name,
        item: const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Explorer',
        )),
    NavigationItems(
        routerName: RouteNames.settings.name,
        item: const BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        )),
    NavigationItems(
        routerName: RouteNames.info.name,
        item: const BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'Info',
        ))
  ];

  int _locationToTabIndex(String location) {
    final index = items.indexWhere((el) => location.startsWith('/${el.routerName}'));
    return index == -1 ? 0 : index;
  }

  @override
  void initState() {
    super.initState();
  }

  void _handleTapNavigationItem(BuildContext context, int tabIndex) {
    if (tabIndex != _locationToTabIndex(GoRouterState.of(context).uri.toString())) {
      context.replaceNamed(items[tabIndex].routerName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items.map((el) => el.item).toList(),
      currentIndex: _locationToTabIndex(GoRouterState.of(context).uri.toString()),
      onTap: (index) => _handleTapNavigationItem(context, index),
    );
  }
}

class NavigationItems {
  NavigationItems({required this.routerName, required this.item});

  String routerName;
  BottomNavigationBarItem item;
}
