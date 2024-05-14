/*
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Views/draw_search.dart';

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
*/

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final IconData? trailingIcon;
  final String txt;
  final VoidCallback? onTap;
  final bool displayInRow;

  CardWidget({
    this.color,
    this.icon,
    this.trailingIcon,
    required this.txt,
    this.onTap,
    this.displayInRow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: displayInRow ? _buildRowContent() : _buildColumnContent(),
        ),
      ),
    );
  }

  Widget _buildColumnContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 40,
          color: Colors.blueAccent,
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.all(2.0),
          child: Text(
            txt,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRowContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
        Text(
          txt,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Icon(
            trailingIcon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
