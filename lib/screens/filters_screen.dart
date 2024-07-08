import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/main_drawer.dart';
import 'package:flutter_application_3/screens/tabs_screen.dart';
import 'package:flutter_application_3/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFreeFilterList = false;
  var _lactoseFreeFilterList = false;
  var _vegetarianFreeFilterList = false;
  var _veganFreeFilterList = false;

  @override
  void initState() {
    super.initState();

    _glutenFreeFilterList = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterList = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFreeFilterList = widget.currentFilters[Filter.vegetarian]!;
    _veganFreeFilterList = widget.currentFilters[Filter.vegan]!;
  }

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
          SwitchListTile(
            value: _glutenFreeFilterList,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeFilterList = isChecked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'Only include gluten-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _lactoseFreeFilterList,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterList = isChecked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include lactose-free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _vegetarianFreeFilterList,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFreeFilterList = isChecked;
              });
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'Only include vegetarian meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _veganFreeFilterList,
            onChanged: (isChecked) {
              setState(() {
                _veganFreeFilterList = isChecked;
              });
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
