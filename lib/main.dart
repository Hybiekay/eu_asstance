import 'features/theme/theme.dart';
import 'package:flutter/material.dart';
import 'features/screens/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eu_assistance/features/theme/app_color.dart';
import 'package:eu_assistance/features/theme/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTheme = ref.watch(AtiveThemeProvider);
    return MaterialApp(
      title: 'Eu Assistance',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: activeTheme == Themes.dark ? ThemeMode.dark : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
