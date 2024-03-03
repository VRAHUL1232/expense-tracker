import 'package:flutter/material.dart';

import 'package:expense/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(230, 174, 139, 255));
var kDarkTheme = 
    ColorScheme.fromSeed(brightness: Brightness.dark,seedColor: const Color.fromARGB(255, 5, 99, 125));

void main() {
    runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkTheme,
        
        cardTheme: const CardTheme().copyWith(
          color: kDarkTheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkTheme.secondaryContainer,
            foregroundColor: kDarkTheme.onPrimaryContainer
          )
        ),
        
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),
          color: kColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kColorScheme.onSecondaryContainer,
                  fontSize: 17.0),
            ),
      ),
      home: const Expenses(),
    ),
  );
  }
