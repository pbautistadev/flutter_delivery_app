import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show
        AppBarTheme,
        BorderRadius,
        Color,
        InputDecorationTheme,
        OutlineInputBorder,
        ThemeData,
        BottomAppBarTheme,
        Colors;
import 'package:google_fonts/google_fonts.dart';

class DeliveryColors {
  static final purple = Color(0xFF5117AC);
  static final green = Color(0xFF20D0C4);
  static final dark = Color(0xFF03091E);
  static final grey = Color(0xFF212738);
  static final lightGrey = Color(0xFFBBBBBB);
  static final veryLightGrey = Color(0xFFF3F3F3);
  static final white = Color(0xFFFFFFFF);
  static final pink = Color(0xFFF5638B);
}

final deliveryGradients = [DeliveryColors.green, DeliveryColors.purple];

final _borderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: DeliveryColors.veryLightGrey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final _borderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(5),
  borderSide: BorderSide(
    color: DeliveryColors.grey,
    width: 2,
    style: BorderStyle.solid,
  ),
);

final ThemeData lightTheme =
    ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: DeliveryColors.white,
        surfaceTintColor: DeliveryColors.white,
        shadowColor: DeliveryColors.dark,
        elevation: 4.0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppinsTextTheme().titleLarge!.copyWith(
          fontSize: 20,
          color: DeliveryColors.purple,
          fontWeight: FontWeight.bold,
        ),
      ),
      canvasColor: DeliveryColors.white,
      bottomAppBarTheme: BottomAppBarTheme(
        color: DeliveryColors.veryLightGrey,
      ),
      scaffoldBackgroundColor: DeliveryColors.white,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.purple,
        displayColor: DeliveryColors.purple,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _borderLight,
        enabledBorder: _borderLight,
        focusedBorder: _borderLight,
        labelStyle: TextStyle(
          color: DeliveryColors.white,
        ),
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.lightGrey,
          fontSize: 10,
        ),
        prefixIconColor: DeliveryColors.purple,
      ),
    ).copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: DeliveryColors.purple,
      ),
      brightness: Brightness.light,
    );

final ThemeData darkTheme =
    ThemeData(
      appBarTheme: AppBarTheme(
        color: DeliveryColors.purple,
        surfaceTintColor: DeliveryColors.white,
        shadowColor: DeliveryColors.dark,
        elevation: 4.0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppinsTextTheme()
            .apply()
            .titleLarge!
            .copyWith(
              fontSize: 20,
              color: DeliveryColors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      canvasColor: DeliveryColors.grey,
      bottomAppBarTheme: BottomAppBarTheme(
        color: Colors.transparent,
      ),
      scaffoldBackgroundColor: DeliveryColors.dark,
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: DeliveryColors.green,
        displayColor: DeliveryColors.green,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: _borderDark,
        enabledBorder: _borderDark,
        focusedBorder: _borderDark,
        labelStyle: TextStyle(
          color: DeliveryColors.purple,
        ),
        fillColor: DeliveryColors.dark,
        filled: true,
        hintStyle: GoogleFonts.poppins(
          color: DeliveryColors.white,
          fontSize: 10,
        ),
        prefixIconColor: DeliveryColors.white,
        iconColor: DeliveryColors.white,
      ),
      iconTheme: IconThemeData(
        color: DeliveryColors.white,
      ),
    ).copyWith(
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: DeliveryColors.white,
      ),
      brightness: Brightness.dark,
    );
