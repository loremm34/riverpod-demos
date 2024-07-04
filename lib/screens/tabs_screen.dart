import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/categories_screen.dart';
import 'package:flutter_application_3/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTab = 0;
  final List<String> _titles = ["Meals", "Favorites"];

  void _selecteTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedTab]),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          CategoriesScreen(),
          MealsScreen(
            title: "",
            meals: [],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _selecteTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: "Meals"),
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Favorites"),
        ],
      ),
    );
  }
}
