import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentDateProvider = StateProvider<String>((ref) {
  String currentDate = DateTime.now().toLocal().toString().split(' ')[0];
  return currentDate;
});
