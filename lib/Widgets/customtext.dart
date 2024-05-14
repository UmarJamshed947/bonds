import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {

  String txt;
  String? heading;
  Color? clr;
  double? fntSize;
  FontWeight? fntWeight;
  double? ltrSpacing;
  TextAlign? textAlign;
  FontStyle? fontStyle;

  CustomText ({ required this.txt, this.fntSize,this.fntWeight,this.clr, this.ltrSpacing,this.textAlign,this.heading,this.fontStyle,
  //  this.clr,  this.fntSize,  this.fntWeight,  this.ltrSpacing
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      textAlign: textAlign,

      style: GoogleFonts.poppins(
          color: clr ?? Colors.white,
          fontSize: fntSize ?? 18,
          fontWeight: fntWeight ?? FontWeight.w700,
          letterSpacing: ltrSpacing ?? 1,
        fontStyle: fontStyle,),
    );
  }
}