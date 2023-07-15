import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eu_assistance/features/theme/theme_provider.dart';

class ThemeSwicth extends ConsumerStatefulWidget {
  const ThemeSwicth({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ThemeSwicthState();
}

class _ThemeSwicthState extends ConsumerState<ThemeSwicth> {
  @override
  Widget build(BuildContext context) {
    void togleThem(bool v) {
      ref.read(AtiveThemeProvider.notifier).state =
          v ? Themes.light : Themes.dark;
    }

    return Switch.adaptive(
        activeColor: Theme.of(context).colorScheme.secondary,
        value: ref.watch(AtiveThemeProvider) == Themes.light,
        onChanged: togleThem);
  }
}
