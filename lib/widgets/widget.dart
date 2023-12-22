import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DrawDropdown extends StatefulWidget {
  final List<String> items;
  final String buttonText;
  final IconData dropdownIcon;
  final Color buttonColor;
  final double buttonHeight;
  final double buttonWidth;
  final EdgeInsetsGeometry buttonPadding;

  const DrawDropdown({
    Key? key,
    required this.items,
    required this.buttonText,
    required this.dropdownIcon,
    required this.buttonColor,
    this.buttonHeight = 60,
    this.buttonWidth = 160,
    this.buttonPadding = const EdgeInsets.only(left: 20, right: 14),
  }) : super(key: key);

  @override
  State<DrawDropdown> createState() => _DrawDropdownState();
}

class _DrawDropdownState extends State<DrawDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                widget.buttonText,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        items: widget.items
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ))
            .toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: widget.buttonHeight,
          width: widget.buttonWidth,
          padding: widget.buttonPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
            ),
            color: widget.buttonColor,
          ),
          elevation: 3,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            widget.dropdownIcon,
          ),
          iconSize: 30,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 180,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal,
          ),
          offset: Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 40, right: 14),
        ),
      ),
    );
  }
}
