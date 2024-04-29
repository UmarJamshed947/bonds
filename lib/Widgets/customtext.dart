import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {

  String txt;
  Color? clr;
  double? fntSize;
  FontWeight? fntWeight;
  double? ltrSpacing;

  CustomText ({ required this.txt, this.fntSize,this.fntWeight,this.clr, this.ltrSpacing
  //  this.clr,  this.fntSize,  this.fntWeight,  this.ltrSpacing
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.poppins(
          color: clr ?? Colors.white,
          fontSize: fntSize ?? 14,
          fontWeight: fntWeight ?? FontWeight.w700,
          letterSpacing: ltrSpacing ?? 1),
    );
  }
}