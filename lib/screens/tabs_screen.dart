import 'package:flutter/material.dart';
import 'package:flutter_application_3/providers/meals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_application_3/screens/categories_screen.dart';
import 'package:flutter_application_3/screens/meals_screen.dart';
import 'package:flutter_application_3/models/meal.dart';
import 'package:flutter_application_3/widgets/main_drawer.dart';
import 'package:flutter_application_3/screens/filters_screen.dart';
import 'package:flutter_application_3/providers/favorites_provider.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedTab = 0;
  final List<String> _titles = ["Meals", "Favorites"];
  Map<Filter, bool> _selectedFilters = kInitialFilters;

  void _selectTab(int index) {
    if (_selectedTab == index) return;
    _selectedTab = index;
    setState(() {});
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) {
            return FiltersScreen(
              currentFilters: _selectedFilters,
            );
          },
        ),
      );

      if (result != null) {
        setState(() {
          _selectedFilters = result;
        });
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final availableMeals = meals.where((meal) {
      if (_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (_selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

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
            availableMeals: availableMeals,
          ),
          MealsScreen(
            title: "",
            meals: favoriteMeals,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _selectTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Meals",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
