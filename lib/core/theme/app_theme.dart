import 'package:flutter/material.dart';
import 'colors_palette.dart';
import 'styles_palette.dart';
import 'theme_style.dart';

class AppTheme {
  static ThemeData get getLightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightColorsPalette.backPrimary,
    unselectedWidgetColor: lightColorsPalette.supportSeparator,
        extensions: [
          ThemeStyle(
            colors: lightColorsPalette,
            styles: lightStylePalette,
          ),
        ],
      );

  static ThemeData get getDarkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: lightColorsPalette.backPrimary,
    unselectedWidgetColor: Colors.red,

    extensions: [
          ThemeStyle(
            colors: lightColorsPalette,
            styles: lightStylePalette,
          ),
        ],
      );

  static const ColorsPalette lightColorsPalette = ColorsPalette(
    supportSeparator: Color.fromRGBO(0, 0, 0, 0.2),
    supportOverlay: Color.fromRGBO(0, 0, 0, 0.06),
    labelPrimary: Color.fromRGBO(0, 0, 0, 1),
    labelSecondary: Color.fromRGBO(0, 0, 0, 0.6),
    labelTertiary: Color.fromRGBO(0, 0, 0, 0.3),
    labelDisable: Color.fromRGBO(0, 0, 0, 0.15),
    colorRed: Color.fromRGBO(255, 59, 48, 1),
    colorGreen: Color.fromRGBO(52, 199, 89, 1),
    colorBlue: Color.fromRGBO(0, 122, 255, 1),
    colorGray: Color.fromRGBO(142, 142, 147, 1),
    colorGrayLight: Color.fromRGBO(209, 209, 214, 1),
    colorWhite: Color.fromRGBO(255, 255, 255, 1),
    backPrimary: Color.fromRGBO(247, 246, 242, 1),
    backSecondary: Color.fromRGBO(255, 255, 255, 1),
    backElevated: Color.fromRGBO(255, 255, 255, 1),
  );

  static const StylesPalette lightStylePalette = StylesPalette(
    medium32: Roboto.medium32,
    medium20: Roboto.medium20,
    medium14: Roboto.medium14,
    regular16: Roboto.regular16,
    regular14: Roboto.regular14,
  );
}
