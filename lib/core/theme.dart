// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       useMaterial3: true,
//       scaffoldBackgroundColor: Colors.white,
//       primaryColor: Colors.black,
//       colorScheme: const ColorScheme.light(
//         primary: Colors.black,
//         secondary: Colors.grey,
//         surface: Colors.white,
//         onSurface: Colors.black,
//         onPrimary: Colors.white,
//       ),
//       textTheme: GoogleFonts.interTextTheme().copyWith(
//         displayLarge: GoogleFonts.inter(
//           color: Colors.black,
//           fontSize: 56,
//           fontWeight: FontWeight.bold,
//           letterSpacing: -1.5,
//         ),
//         displayMedium: GoogleFonts.inter(
//           color: Colors.black,
//           fontSize: 48,
//           fontWeight: FontWeight.bold,
//           letterSpacing: -0.5,
//         ),
//         headlineLarge: GoogleFonts.inter(
//           color: Colors.black,
//           fontSize: 32,
//           fontWeight: FontWeight.w600,
//         ),
//         headlineMedium: GoogleFonts.inter(
//           color: Colors.black,
//           fontSize: 28,
//           fontWeight: FontWeight.w600,
//         ),
//         titleLarge: GoogleFonts.inter(
//           color: Colors.black,
//           fontSize: 22,
//           fontWeight: FontWeight.w500,
//         ),
//         bodyLarge: GoogleFonts.inter(
//           color: Colors.black87,
//           fontSize: 18,
//           height: 1.6,
//         ),
//         bodyMedium: GoogleFonts.inter(
//           color: Colors.black87,
//           fontSize: 16,
//           height: 1.5,
//         ),
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.black),
//         titleTextStyle: TextStyle(
//           color: Colors.black,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.black,
//           foregroundColor: Colors.white,
//           elevation: 0,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           textStyle: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: Colors.black,
//           side: const BorderSide(color: Colors.black, width: 2),
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//           textStyle: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundDarkPrimary   = Color(0xff25262A);
const Color backgroundDarkSecondary = Color(0xff2D2E32);
const Color accentMint              = Color(0xff6EF3A5);
const Color textDisabled            = Color(0xff7E7F84);
const Color textWhite               = Color(0xffFFFFFF);

class AppTheme {
  static ThemeData get darkTheme {
    final baseTextTheme = GoogleFonts.montserratTextTheme();

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: backgroundDarkSecondary,

      colorScheme: const ColorScheme.dark(
        primary: accentMint,
        secondary: accentMint,
        surface: backgroundDarkSecondary,
        onPrimary: backgroundDarkPrimary,
        onSecondary: backgroundDarkPrimary,
        onSurface: textWhite,
      ),

      textTheme: baseTextTheme.copyWith(
        displayLarge: baseTextTheme.displayLarge?.copyWith(
          color: textWhite,
          fontSize: 56,
          fontWeight: FontWeight.bold,
          letterSpacing: -1.2,
        ),
        displayMedium: baseTextTheme.displayMedium?.copyWith(
          color: textWhite,
          fontSize: 48,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: baseTextTheme.headlineLarge?.copyWith(
          color: textWhite,
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: baseTextTheme.headlineMedium?.copyWith(
          color: textWhite,
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: baseTextTheme.titleLarge?.copyWith(
          color: textWhite,
          fontSize: 22,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: baseTextTheme.bodyLarge?.copyWith(
          color: textWhite,
          fontSize: 18,
          height: 1.6,
        ),
        bodyMedium: baseTextTheme.bodyMedium?.copyWith(
          color: textDisabled,
          fontSize: 16,
          height: 1.5,
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDarkSecondary,
        elevation: 0,
        iconTheme: IconThemeData(color: textWhite),
        titleTextStyle: TextStyle(
          color: textWhite,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentMint,
          foregroundColor: backgroundDarkPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          textStyle: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accentMint,
          side: const BorderSide(color: accentMint, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          textStyle: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
