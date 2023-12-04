import 'package:flutter/material.dart';
import 'package:newsapp/screens/home.dart';
import 'package:newsapp/screens/search_news.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedPage = 0;

  void _selectedIndex(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const HomeScreen();

    if (_selectedPage == 1) {
      mainContent = const SearchNewsScreen();
    }

    return Scaffold(
      body: mainContent,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 30),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded),label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search),label: 'Search'),
        ],
        selectedIndex: _selectedPage,
        onDestinationSelected: _selectedIndex,
      ),
    );
  }
}
