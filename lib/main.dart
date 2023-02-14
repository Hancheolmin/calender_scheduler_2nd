import 'package:calender_scheduler_2nd/database/drift_database.dart';
import 'package:calender_scheduler_2nd/model/category_color.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

const defaultColors = [
  'f44336',
  'ff9800',
  'ffeb3b',
  'fcaf50',
  '2196f3',
  '3f51b5',
  '9c27b0'
];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  final colors = await database.getCategoryColors();

  if (colors.isEmpty) {
    for (String hexCode in defaultColors) {
      await database.createCategoryColor(
        CategoryColorsCompanion(
          hexCode: Value(hexCode),
        ),
      );
    }
  }

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'notoSans',
      ),
      home: HomeScreen(),
    ),
  );
}
