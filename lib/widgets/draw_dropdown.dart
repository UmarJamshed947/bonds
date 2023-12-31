import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';



class DrawDropdown extends StatefulWidget {


  @override
  State<DrawDropdown> createState() => _DrawDropdownState();
}

class _DrawDropdownState extends State<DrawDropdown> {
  final List<String> items = [
    '100',
    '200',
    '750',
    '1500',
    '7,500',
    '25,000',
    '40,000',
    'Premium 40,000',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint:  Row(
              children: [
                Expanded(
                  child: Text(
                    'Select Draw',
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
            items: items
                .map((String item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style:  TextStyle(
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
              height: 60,
              width: 160,
              padding:  EdgeInsets.only(left: 20, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.teal.shade500,
              ),
              elevation: 3,
            ),
            iconStyleData:  IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
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
              offset:  Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius:  Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData:  MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 40, right: 14),
            ),
          ));



  }
}