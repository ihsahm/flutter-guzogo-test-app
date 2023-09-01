import 'package:flutter/material.dart';
import 'package:flutter_project/views/homepage.dart';

class NavBar extends StatefulWidget {
  static Page page() => const MaterialPage<void>(child: NavBar());
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      const Center(child: HomePage()),
      // Center(child: SearchDashboard()),
      const Center(child: HomePage()),
      const Center(child: HomePage()),
      const Center(child: HomePage()),
    ];
    final items = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: "Search"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.laptop_chromebook,
          ),
          label: "Booking"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.notifications), label: "Notifications"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: 'Setting'),
    ];
    assert(pages.length == items.length);

    final bottomNavBar = BottomNavigationBar(
        items: items,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            _currentTabIndex = index;
          });
        });
    return Scaffold(
      body: pages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
