import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/main_drawer.dart';
import 'package:flutter_application_3/screens/tabs_screen.dart';
import 'package:flutter_application_3/widgets/switch_list_tile_item.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterList = false;
  var _lactoseFreeFilterList = false;
  var _vegetarianFreeFilterList = false;
  var _veganFreeFilterList = false;

  void _onSwitchFilterChange(bool isSwitched, String filterType) {
    setState(() {
      switch (filterType) {
        case 'gluten':
          _glutenFreeFilterList = isSwitched;
          break;
        case 'lactose':
          _lactoseFreeFilterList = isSwitched;
          break;
        case 'vegetarian':
          _vegetarianFreeFilterList = isSwitched;
          break;
        case 'vegan':
          _veganFreeFilterList = isSwitched;
          break;
      }
    });
  }

  void _selectScreen(String identifier) {
    Navigator.of(context).pop();
    if (identifier == "meals") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return TabsScreen();
          },
        ),
      );
    }
  }

  void _saveFilters() {
    Navigator.of(context).pop({
      Filter.glutenFree: _glutenFreeFilterList,
      Filter.lactoseFree: _lactoseFreeFilterList,
      Filter.vegetarian: _vegetarianFreeFilterList,
      Filter.vegan: _veganFreeFilterList,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      appBar: AppBar(title: const Text("Your Filters"), actions: [
        IconButton(
          icon: const Icon(Icons.save),
          onPressed: _saveFilters,
        ),
      ]),
      body: Column(
        children: [
          SwitchListTileItem(
            filterList: _glutenFreeFilterList,
            toogleChange: (bool isCheked) {
              _onSwitchFilterChange(isCheked, 'gluten');
            },
            mealsFilter: 'Gluten-free',
            mealsFilterDetails: 'Only includes gluten-free meals',
          ),
          SwitchListTileItem(
            filterList: _lactoseFreeFilterList,
            toogleChange: (bool isCheked) {
              _onSwitchFilterChange(isCheked, 'lactose');
            },
            mealsFilter: 'Lactose-free',
            mealsFilterDetails: 'Only includes lactose-free meals',
          ),
          SwitchListTileItem(
            filterList: _vegetarianFreeFilterList,
            toogleChange: (bool isCheked) {
              _onSwitchFilterChange(isCheked, 'vegetarian');
            },
            mealsFilter: 'Vegetarian',
            mealsFilterDetails: 'Only includes vegetarian meals',
          ),
          SwitchListTileItem(
            filterList: _veganFreeFilterList,
            toogleChange: (bool isCheked) {
              _onSwitchFilterChange(isCheked, 'vegan');
            },
            mealsFilter: 'Vegan',
            mealsFilterDetails: 'Only includes vegan meals',
          ),
        ],
      ),
    );
  }
}
