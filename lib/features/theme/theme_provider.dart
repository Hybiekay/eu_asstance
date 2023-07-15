import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore_for_file: non_constant_identifier_names

final AtiveThemeProvider = StateProvider<Themes>((ref) {
  return Themes.light;
});

enum Themes { dark, light }
