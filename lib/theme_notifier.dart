import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
    (ref) => ThemeNotifier(ThemeData()));

/// This statenotifier will update the themeData in MaterialApp
class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier(super.state);

  // If you want to set the whole themeData from scratch
  void setTheme(ThemeData themeData) {
    state = themeData;
  }

  // Only update the backgroundColor in Existing ThemeData
  void updateBackgroundColor(Color color) {
    state = state.copyWith(backgroundColor: color);
  }

  // Only update the primaryColor in Existing ThemeData
  void updatePrimaryColor(Color color) {
    state = state.copyWith(primaryColor: color);
  }

  // Only update the secondaryHeaderColor in Existing ThemeData
  void updateSecondaryHeaderColor(Color color) {
    state = state.copyWith(secondaryHeaderColor: color);
  }
}
