import 'package:flutter/material.dart';
import '../../app_theme.dart';

enum AppThemes {
  DEFAULT,
  SANDRED,
  MEDNIGHT;

  static AppThemes from(String type) => AppThemes.values.firstWhere((e) => e.name == type);

  AppThemeData get appTheme {
    switch (this) {
      case AppThemes.SANDRED:
        return _AppThemeCollection.SANDRED;
      case AppThemes.MEDNIGHT:
        return _AppThemeCollection.MEDNIGHT;
      default:
        return _AppThemeCollection.DEFAULT;
    }
  }
}

abstract class _AppThemeCollection {
  static AppThemeData get DEFAULT => const AppThemeData(
        colorScheme: AppColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF335CA8),
          onPrimary: Color(0xFFFFFFFF),
          primaryContainer: Color(0xFFD8E2FF),
          onPrimaryContainer: Color(0xFF001A42),
          secondary: Color(0xFF0961A4),
          onSecondary: Color(0xFFFFFFFF),
          secondaryContainer: Color(0xFFD2E4FF),
          onSecondaryContainer: Color(0xFF001C37),
          tertiary: Color(0xFF335CA8),
          onTertiary: Color(0xFFFFFFFF),
          tertiaryContainer: Color(0xFFD8E2FF),
          onTertiaryContainer: Color(0xFF001A42),
          error: Color(0xFFBA1A1A),
          errorContainer: Color(0xFFFFDAD6),
          onError: Color(0xFFFFFFFF),
          onErrorContainer: Color(0xFF410002),
          background: Color(0xFFFEFBFF),
          onBackground: Color(0xFF1B1B1F),
          surface: Color(0xFFFEFBFF),
          onSurface: Color(0xFF1B1B1F),
          surfaceVariant: Color(0xFFE1E2EC),
          onSurfaceVariant: Color(0xFF44474F),
          outline: Color(0xFF757780),
          onInverseSurface: Color(0xFFF2F0F4),
          inverseSurface: Color(0xFF303034),
          inversePrimary: Color(0xFFAEC6FF),
          shadow: Color(0xFF000000),
          surfaceTint: Color(0xFF335CA8),
          outlineVariant: Color(0xFFC5C6D0),
          scrim: Color(0xFF000000),
          icon: Color(0xff53A1EB),
          primaryUserMessageCard: Color(0xff52A2E9),
          clientMessageCard: Color(0xffF0F0F0),
          clientText: Colors.black,
          primaryUserText: Color(0xffF9FAFC),
          clientCaption: Colors.black54,
          primaryUserCaption: Colors.white54,
          primeryText: Colors.black,
          secondaryText: Colors.black45,
        ),
      );

  static AppThemeData get SANDRED => const AppThemeData(
          colorScheme: AppColorScheme(
        brightness: Brightness.light,
        primary: Color(0xffbf360c),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffffdbd1),
        onPrimaryContainer: Color(0xff141211),
        secondary: Color(0xffbe593b),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffffede8),
        onSecondaryContainer: Color(0xff141413),
        tertiary: Color(0xff466827),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffc6ef9f),
        onTertiaryContainer: Color(0xff11140e),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff141212),
        background: Color(0xfffdf9f8),
        onBackground: Color(0xff090909),
        surface: Color(0xfffdf9f8),
        onSurface: Color(0xff090909),
        surfaceVariant: Color(0xffebe3e1),
        onSurfaceVariant: Color(0xff121111),
        outline: Color(0xff7c7c7c),
        outlineVariant: Color(0xffc8c8c8),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff151210),
        onInverseSurface: Color(0xfff5f5f5),
        inversePrimary: Color(0xffffc0a5),
        surfaceTint: Color(0xffbf360c),
        clientCaption: Color(0xFFD6C3B6),
        clientMessageCard: Color(0xFFFFDCBC),
        clientText: Color(0xFF201B17),
        icon: Color(0xFF201B17),
        primaryUserCaption: Color(0xFF201B17),
        primaryUserMessageCard: Color(0xFF895200),
        primaryUserText: Color(0xFF201B17),
        primeryText: Color(0xFF8F4E00),
        secondaryText: Color(0xFF201B17),
      ));

  static AppThemeData get MEDNIGHT => const AppThemeData(
          colorScheme: AppColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF6A4FA3),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFEADDFF),
        onPrimaryContainer: Color(0xFF25005A),
        secondary: Color(0xFF984061),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFFFD9E2),
        onSecondaryContainer: Color(0xFF3E001D),
        tertiary: Color(0xFF5C53A7),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFE4DFFF),
        onTertiaryContainer: Color(0xFF170362),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFFFBFF),
        onBackground: Color(0xFF1D1B1E),
        surface: Color(0xFFFFFBFF),
        onSurface: Color(0xFF1D1B1E),
        surfaceVariant: Color(0xFFE7E0EB),
        onSurfaceVariant: Color(0xFF49454E),
        outline: Color(0xFF7A757F),
        onInverseSurface: Color(0xFFF5EFF4),
        inverseSurface: Color(0xFF323033),
        inversePrimary: Color(0xFFD2BBFF),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF6A4FA3),
        outlineVariant: Color(0xFFCBC4CF),
        scrim: Color(0xFF000000),
        clientCaption: Color(0xFFFFFFFF),
        clientMessageCard: Color(0xFF984061),
        clientText: Color(0xFFFFFFFF),
        icon: Color(0xFF7A757F),
        primaryUserCaption: Color(0xFF25005A),
        primaryUserMessageCard: Color(0xFFD2BBFF),
        primaryUserText: Color(0xFF25005A),
        primeryText: Color(0xFF25005A),
        secondaryText: Color(0xFF25005A),
      ));
}
