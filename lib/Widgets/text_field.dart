import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final Color borderColor;
  final Color labelColor;
  final TextStyle? hintStyle;
  final String? requiredMessage;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.labelText = "Search Numbers",
    this.borderColor = const Color(0xFF2196F3),
    this.labelColor = const Color(0xFF2196F3),
    this.hintStyle,
    this.requiredMessage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          style:TextStyle(color: Color(0xFF2196F3),fontSize: 16,fontWeight: FontWeight.bold),
          cursorColor: Color(0xFF2196F3),
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
            hintStyle: hintStyle ?? GoogleFonts.nunito(color: Color(0xFF2196F3)),
          ),

        ),
        if (requiredMessage != null && controller.text.isEmpty) // Conditionally show required message
          Text(
            requiredMessage!,
            style: TextStyle(color: Colors.red,fontSize: 12),
          ),
      ],
    );
  }
}
