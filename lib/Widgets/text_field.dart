import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    this.borderColor = const Color(0xFF2EC4B6),
    this.labelColor = const Color(0xFF333333),
    this.hintStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:TextStyle(color: Color(0xFF333333),fontSize: 16,fontWeight: FontWeight.bold),
      cursorColor: Color(0xFF2EC4B6),
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
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
        hintStyle: hintStyle ?? GoogleFonts.nunito(color: Color(0xFF2EC4B6)),
      ),
    );
  }
}
