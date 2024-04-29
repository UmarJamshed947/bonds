import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color borderColor;
  final Color labelColor;
  final TextStyle? hintStyle;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelText = "Search Numbers",
    this.borderColor = Colors.white,
    this.labelColor = Colors.white,
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: borderColor, width: 4),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: BorderSide(color: borderColor, width: 2),
        ),
        labelText: labelText,
        labelStyle: TextStyle(color: labelColor),
        hintStyle: hintStyle ?? GoogleFonts.nunito(color: Colors.white),
      ),
    );
  }
}
