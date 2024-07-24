import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ThemeExtensions on BuildContext {
  Color get colorPrimary => Colors.green;

  TextStyle get _baseStyle => Theme.of(this).textTheme.bodyMedium!;

  TextStyle get textCaption => _baseStyle.merge(
        GoogleFonts.outfit(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      );

  TextStyle get textBody => _baseStyle.merge(
        GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      );

  TextStyle get textButton => _baseStyle.merge(
        GoogleFonts.outfit(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );

  TextStyle get textHeadline => _baseStyle.merge(
        GoogleFonts.outfit(
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      );
}
