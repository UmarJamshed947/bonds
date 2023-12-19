import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWidget extends StatelessWidget {
  final Color? color;
  final IconData? icon;
  final String txt;

  CardWidget ({this.color, this.icon, required this.txt});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(6.0),
      child: Card(
        elevation: 2,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.white),
        ),
        child: InkWell(
          onTap: () {
            // Handle item tap
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                  size: 50,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}