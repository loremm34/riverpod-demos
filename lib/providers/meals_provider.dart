import 'package:riverpod/riverpod.dart';
import 'package:flutter_application_3/data/default_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
