import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts{
  static TextStyle normalStyle({double? fontSize,Color? color,FontWeight? fontWeight,double?letterSpacing,double?height})=>GoogleFonts.inter(
    fontSize: fontSize,
    color: color,
    letterSpacing:letterSpacing,
    fontWeight: fontWeight,
    height: height,
  );
}