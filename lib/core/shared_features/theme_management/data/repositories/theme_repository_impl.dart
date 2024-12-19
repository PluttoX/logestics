// data/repositories/theme_repository_impl.dart
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final GetStorage storage;

  ThemeRepositoryImpl(this.storage);

  @override
  Future<ThemeMode?> getTheme() async {
    final themeString = storage.read<String>('themeMode');
    if (themeString == null) return null; // No preference saved
    return themeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Future<void> saveTheme(ThemeMode themeMode) async {
    final themeString = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await storage.write('themeMode', themeString);
  }
}
