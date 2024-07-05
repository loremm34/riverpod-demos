import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/main_drawer.dart';
import 'package:flutter_application_3/screens/tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterList = false;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _selectScreen,
      ),
      appBar: AppBar(
        title: Text("Your Filters"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeFilterList,
            onChanged: (isCheked) {
              setState(() {
                _glutenFreeFilterList = isCheked;
              });
            },
            title: Text(
              "Gluten-free",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Only includes gluten-free meals",
            ),
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          )
        ],
      ),
    );
  }
}
