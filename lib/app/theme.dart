part of 'app.dart';

final _theme = ThemeData(
  primaryColor: const Color(0xFF333333),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF333333),
    secondary: Color(0xFF666666),
    surface: Color(0xFFF8F8F8),
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    margin: const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
  ),
  textTheme: GoogleFonts.interTextTheme(
    const TextTheme(
      bodySmall: TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF8F1A1D),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24.0,
      fontWeight: FontWeight.w500,
    ),
  ),
);
