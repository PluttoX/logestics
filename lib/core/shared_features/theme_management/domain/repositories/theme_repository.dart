// data/repositories/theme_repository.dart
import 'package:flutter/material.dart';

abstract class ThemeRepository {
  Future<ThemeMode?> getTheme();
  Future<void> saveTheme(ThemeMode themeMode);
}
