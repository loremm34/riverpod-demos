import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/categories_screen.dart';
import 'package:flutter_application_3/screens/meals_screen.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_application_3/widgets/main_drawer.dart';
import 'package:flutter_application_3/screens/filters_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTab = 0;
  final List<Meal> _favorites = [];
  final List<String> _titles = ["Meals", "Favorites"];

  void _selecteTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(
          seconds: 5,
        ),
        content: Text(message),
      ),
    );
  }

  void _toogleMealFavoriteStatus(Meal meal) {
    final isExisting = _favorites.contains(meal);

    if (isExisting) {
      _favorites.remove(meal);
      _showInfoMessage("Meal is no longer in favorites");
    } else {
      _favorites.add(meal);
      _showInfoMessage("Marked as favorite");
    }
    setState(() {});
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) {
            return FiltersScreen();
          },
        ),
      );
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(_titles[_selectedTab]),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          CategoriesScreen(
            onFavotiteToogle: _toogleMealFavoriteStatus,
          ),
          MealsScreen(
            title: "",
            meals: _favorites,
            onFavotiteToogle: _toogleMealFavoriteStatus,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _selecteTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
