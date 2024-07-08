import 'package:flutter_application_3/data/default_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider() используется только для статичных данных которые не меняются
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
