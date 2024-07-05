import 'package:flutter/material.dart';

class SwitchListTileItem extends StatelessWidget {
  const SwitchListTileItem({
    super.key,
    required this.filterList,
    required this.toogleChange,
    required this.mealsFilter,
    required this.mealsFilterDetails,
  });

  final bool filterList;
  final void Function(bool isCheked) toogleChange;
  final String mealsFilter;
  final String mealsFilterDetails;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: filterList,
      onChanged: toogleChange,
      title: Text(
        mealsFilter,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        mealsFilterDetails,
      ),
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
    );
  }
}
