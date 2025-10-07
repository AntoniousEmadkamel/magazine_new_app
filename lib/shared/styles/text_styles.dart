import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
class TextStyles{
  static TextTheme lightTextTheme=TextTheme(

  titleLarge: GoogleFonts.exo(color: onappbar,fontWeight: FontWeight.w400,fontSize: 22,) ,
  titleSmall: GoogleFonts.exo(color: onappbar,fontWeight: FontWeight.w400,fontSize: 14) ,

  bodyLarge:GoogleFonts.poppins (color: intro,fontSize: 22,fontWeight: FontWeight.w700),
  titleMedium:GoogleFonts.poppins(color: onappbar,fontWeight: FontWeight.w700,fontSize: 24) ,
  labelSmall:GoogleFonts.poppins(color: sourcetitleNewscolor,fontWeight: FontWeight.w400,fontSize: 10) ,
  labelLarge:GoogleFonts.poppins(color: titleNewscolor,fontWeight: FontWeight.w500,fontSize: 14) ,
  bodyMedium:GoogleFonts.poppins(color:titleNewscolor,fontWeight: FontWeight.w300,fontSize: 13) ,
  headlineMedium: GoogleFonts.poppins(color: blacked,fontSize: 14,fontWeight:FontWeight.w700 ),

  labelMedium:GoogleFonts.inter(color:timeNewsColor,fontWeight: FontWeight.w400,fontSize: 13) ,
  headlineSmall: GoogleFonts.inter(color: appbarcolor,fontSize: 14,fontWeight:FontWeight.w400 ),
  );
}