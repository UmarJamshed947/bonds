import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTableCell extends StatelessWidget {
   String txt;
   Color? clr;

  CustomTableCell ({required this.txt, this.clr});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Center(
        child: Text(
          txt,
          style: GoogleFonts.poppins(
            // color: Color(0xFF333333),
            fontWeight: FontWeight.bold,
            fontSize: 15,

            color: clr ?? Color(0xFF2196F3),

              ),
        ),
      ),
    );
  }
}
