import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Views/Draw_Search.dart';

class CardWidget extends StatelessWidget {

  final Color? color;
  final IconData? icon;
  final String txt;
  final VoidCallback? onTap;

  CardWidget({this.color, this.icon, required this.txt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),

      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  txt,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
