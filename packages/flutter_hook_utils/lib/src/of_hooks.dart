import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum TextThemeProp {
  headline1,
  headline2,
  headline3,
  headline4,
  headline5,
  headline6,
  bodyLarge,
  bodyMedium,
  bodySmall,
  displayLarge,
  displayMedium,
  displaySmall,
  bodyText1,
  bodyText2,
  button,
  caption,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  overline,
  subtitle1,
  subtitle2,
  titleLarge,
  titleMedium,
  titleSmall,
}

extension TextThemeToMap on TextTheme {
  Map<TextThemeProp, TextStyle?> toMap() {
    return {
      TextThemeProp.headline1: headline1,
      TextThemeProp.headline2: headline2,
      TextThemeProp.headline3: headline3,
      TextThemeProp.headline4: headline4,
      TextThemeProp.headline5: headline5,
      TextThemeProp.headline6: headline6,
      TextThemeProp.bodyLarge: bodyLarge,
      TextThemeProp.bodyMedium: bodyMedium,
      TextThemeProp.bodySmall: bodySmall,
      TextThemeProp.displayLarge: displayLarge,
      TextThemeProp.displayMedium: displayMedium,
      TextThemeProp.displaySmall: displaySmall,
      TextThemeProp.bodyText1: bodyText1,
      TextThemeProp.bodyText2: bodyText2,
      TextThemeProp.button: button,
      TextThemeProp.caption: caption,
      TextThemeProp.headlineLarge: headlineLarge,
      TextThemeProp.headlineMedium: headlineMedium,
      TextThemeProp.headlineSmall: headlineSmall,
      TextThemeProp.labelLarge: labelLarge,
      TextThemeProp.labelMedium: labelMedium,
      TextThemeProp.labelSmall: labelSmall,
      TextThemeProp.overline: overline,
      TextThemeProp.subtitle1: subtitle1,
      TextThemeProp.subtitle2: subtitle2,
      TextThemeProp.titleLarge: titleLarge,
      TextThemeProp.titleMedium: titleMedium,
      TextThemeProp.titleSmall: titleSmall,
    };
  }
}

ThemeData useTheme() {
  return Theme.of(useContext());
}

TextStyle? useTextTheme(TextThemeProp key) {
  final textTheme = useTheme().textTheme;
  return textTheme.toMap()[key];
}

MediaQueryData useMediaQuery() {
  return MediaQuery.of(useContext());
}

ScaffoldMessengerState useScaffoldMessenger() {
  return ScaffoldMessenger.of(useContext());
}
