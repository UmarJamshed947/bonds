import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTableCell extends StatelessWidget {
   String txt;
   Color? clr;
   FontWeight? fntWeight;

  CustomTableCell ({required this.txt, this.clr,this.fntWeight});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Center(
        child: Text(
          txt,
          style: GoogleFonts.poppins(
            // color: Color(0xFF333333),
            fontWeight:  fntWeight ?? FontWeight.normal ,
            fontSize: 15,

            color: clr ?? Color(0xFF2196F3),

              ),
        ),
      ),
    );
  }
}
