import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

extension AppThemeExtensions on ThemeData {
  Color get background => AppTheme.theme.bgColor;
  Color get background1 => AppTheme.theme.bgColor1;
  Color get background2 => AppTheme.theme.bgColor2;
  Color get background3 => AppTheme.theme.bgColor3;
  Color get primary => AppTheme.theme.primaryColor;
  Color get mainColor => AppTheme.theme.mainColor;
  Color get onPrimary => AppTheme.theme.onPrimaryColor;
  Color get primaryTint => AppTheme.theme.primaryTintColor;
  Color get secondary => AppTheme.theme.secondaryColor;
  Color get accent => AppTheme.theme.accentColor;
  Color get onAccent => AppTheme.theme.onAccentColor;
  Color get focus => AppTheme.theme.focusColor;
  Color get onFocus => AppTheme.theme.onFocusColor;
  Color get surface => AppTheme.theme.surface;
  Color get greyWeak => AppTheme.theme.greyWeakColor;
  Color get grey => AppTheme.theme.greyColor;
  Color get greyMedium => AppTheme.theme.greyMediumColor;
  Color get greyStrong => AppTheme.theme.greyStrongColor;

  Color get mainTextColor => AppTheme.theme.mainTextColor;
  Color get inverseTextColor => AppTheme.theme.inverseTextColor;
}


// Themes
enum ThemeType {
  LIGHT_BLUE,
  DARK_BLUE,
}

class AppTheme {
  static const ThemeType defaultTheme = ThemeType.LIGHT_BLUE;

  late ThemeType type;
  bool isDark;

  late Color mainColor;
  late Color primaryColor;
  late Color onPrimaryColor;
  late Color primaryTintColor;
  late Color secondaryColor;
  late Color accentColor;
  late Color onAccentColor;
  late Color bgColor;
  late Color bgColor1;
  late Color bgColor2;
  late Color bgColor3;
  late Color focusColor;
  late Color onFocusColor;
  late Color greyWeakColor;
  late Color greyColor;
  late Color greyMediumColor;
  late Color greyStrongColor;
  late Color surface;

  late Color mainTextColor;
  late Color inverseTextColor;

  AppTheme({this.isDark = false}) {
    mainTextColor = isDark ? Colors.white : Colors.black;
    inverseTextColor = isDark ? Colors.black : Colors.white;
  }

  factory AppTheme.fromType(ThemeType t) {
    switch(t) {
      case ThemeType.LIGHT_BLUE:
        return AppTheme(isDark: false)
          ..type = t
          ..mainColor = Color(0xFF9E2757)
          ..primaryColor = Color(0xFF0C54A1)
          ..onPrimaryColor = Color(0xFFFFFFFF)
          ..primaryTintColor = Color(0x300C54A1)
          ..accentColor = Color(0xFFD0103F)
          ..onAccentColor = Color(0xFFFFFFFF)
          ..focusColor = Color(0x300C54A1)
          ..onFocusColor = Color(0xFFFFFFFF)
          ..secondaryColor = Color(0xFF000000)
          ..bgColor = Color(0xFFFFFFFF)
          ..bgColor1 = Color(0xFFdbe5f1)
          ..bgColor2 = Color(0xFFf0f3f8)
          ..surface = Color(0xFFFFFFFF)
          ..greyWeakColor = const Color(0xffcccccc)
          ..greyColor = const Color(0xff999999)
          ..greyMediumColor = const Color(0xff747474)
          ..greyStrongColor = const Color(0xff333333);
      case ThemeType.DARK_BLUE:
        return AppTheme(isDark: true)
          ..type = t
          ..primaryColor = Color(0xFF0C54A1)
          ..onPrimaryColor = Color(0xFFFFFFFF)
          ..primaryTintColor = Color(0x300C54A1)
          ..accentColor = Color(0xFFD0103F)
          ..onAccentColor = Color(0xFFFFFFFF)
          ..focusColor = Color(0x300C54A1)
          ..onFocusColor = Color(0xFFFFFFFF)
          ..secondaryColor = Color(0xFFFFFFFF)
          ..bgColor = Color(0xFF263236)
          ..bgColor1 = Color(0xFFdbe5f1)
          ..bgColor2 = Color(0xFFf0f3f8)
          ..bgColor3 = Color(0xFFF5F5F5)
          ..surface = Color(0xFFFFFFFF)
          ..greyWeakColor = const Color(0xffcccccc)
          ..greyColor = const Color(0xff999999)
          ..greyMediumColor = const Color(0xff747474)
          ..greyStrongColor = const Color(0xff333333);
    }
    return AppTheme.fromType(defaultTheme);
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      // Use the .dark() and .light() constructors to handle the text themes
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      // Use ColorScheme to generate the bulk of the color theme
      colorScheme: ColorScheme(
          brightness: isDark ? Brightness.dark : Brightness.light,
          primary: primaryColor,
          primaryVariant: shift(primaryColor, .1),
          secondary: secondaryColor,
          secondaryVariant: shift(primaryColor, .1),
          background: bgColor,
          surface: surface,
          onBackground: mainTextColor,
          onSurface: mainTextColor,
          onError: mainTextColor,
          onPrimary: inverseTextColor,
          onSecondary: inverseTextColor,
          error: focusColor),
    );
    // Apply additional styling that is missed by ColorScheme
    t.copyWith(
        visualDensity: VisualDensity.compact,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: primaryColor,
          selectionHandleColor: Colors.transparent,
          selectionColor: primaryColor,
        ),
        buttonColor: primaryColor,
        primaryColor: primaryColor,
        highlightColor: shift(primaryColor, .1),
        toggleableActiveColor: primaryColor);
    // All done, return the ThemeData
    return t;
  }

  Color shift(Color c, double amt) {
    amt *= (isDark ? -1 : 1);
    var hslc = HSLColor.fromColor(c); // Convert to HSL
    double lightness = (hslc.lightness + amt).clamp(0, 1.0) as double; // Add/Remove lightness
    return hslc.withLightness(lightness).toColor(); // Convert back to Color
  }

  static changeTheme(ThemeType type) {
    final theme = AppTheme.fromType(type);
    if (theme.isDark) {
      lightTheme = theme;
      Get.changeTheme(ThemeData.light());
    } else {
      darkTheme = theme;
      Get.changeTheme(ThemeData.dark());
    }
  }

  static AppTheme get theme => Get.isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme;

  static AppTheme lightTheme = AppTheme.fromType(ThemeType.LIGHT_BLUE);
  static AppTheme darkTheme = AppTheme.fromType(ThemeType.DARK_BLUE);
}

// Text styles
class AppTextStyles {
  static mPlusRounded1c(
          {double fontSize = 12.0,
          fontWeight = FontWeight.w700,
          color,
          height = 1.2,
          decorationColor,
          decoration}) =>
      GoogleFonts.mPlusRounded1c(
          height: height,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color ?? Get.theme.mainTextColor,
          decorationColor: decorationColor,
          decoration: decoration);

  static robotoCondensed(
          {double fontSize = 20.0,
          fontWeight = FontWeight.w400,
          color}) =>
      GoogleFonts.robotoCondensed(

          fontSize: fontSize, fontWeight: fontWeight,
          color: color ?? Get.theme.mainTextColor);

  static roboto(
      {double fontSize = 20.0,
        fontWeight = FontWeight.w400,
        color}) =>
      GoogleFonts.roboto(
          fontSize: fontSize, fontWeight: fontWeight,
          color: color ?? Get.theme.mainTextColor);
}
