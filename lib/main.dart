import 'package:flutter/material.dart';
import 'package:newsapp/screens/splash_screen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 104, 0, 240));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 1, 58));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'News Pulse',
        theme: ThemeData(
          colorScheme: kColorScheme,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
        ),
        themeMode: ThemeMode.system,
        home: const SplashScreen());
  }
}
