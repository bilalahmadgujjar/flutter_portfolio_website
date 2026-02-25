
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget text(
    {
      required String text,
      double fontSize = 12.0,
      Color textColor = Colors.black,
      TextAlign textAlign = TextAlign.left,
      TextDecoration textDecoration = TextDecoration.none,
      FontWeight fontWeight = FontWeight.w400,
      TextOverflow overflow = TextOverflow.clip,
      Color decorationColor = Colors.red,
      FontStyle fontStyle = FontStyle.normal,
      double? height,
      String? fontFamily,
      int? maxLines, TextStyle? textStyle,
      Key? nameKey,
      double? letterSpace,
    }) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    key: nameKey,
    style: textStyle ??
        GoogleFonts.montserrat(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          letterSpacing: letterSpace,
          fontStyle: fontStyle,
          height: height,
          decoration: textDecoration,
          decorationColor: decorationColor,
        ),

    //     TextStyle(
    //   fontSize: fontSize,
    //   color: textColor,
    //   fontWeight: fontWeight,
    //   fontStyle: fontStyle,
    //   height: height,
    //   decoration: textDecoration,
    //   decorationColor: decorationColor, fontFamily: fontFamily??'Inter',
    //
    // ),
  );
}