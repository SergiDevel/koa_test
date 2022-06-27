import 'package:flutter/material.dart';

const _primaryColor = Color(0xFFF7E7DF);
const blackColor = Colors.black;
const whiteColor = Colors.white;
const orangeColor = Colors.orange;
const redColor = Colors.redAccent;

const toolbarHeightMultiplier = 0.1;

/// Returns [ThemeData] for the Koa app.
final koaTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: _primaryColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: _primaryColor,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: blackColor,
      fontWeight: FontWeight.bold,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: redColor,
      padding: EdgeInsets.zero,
    ),
  ),
  cardTheme: const CardTheme(elevation: 1),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    unselectedItemColor: blackColor,
    selectedItemColor: redColor,
  ),
);
