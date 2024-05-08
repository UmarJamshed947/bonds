import 'package:bonds/Models/Draw_Date.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'customtext.dart';

class DateDropdown extends StatefulWidget {
  String? drawUid;
  final ValueChanged<String?> onDateSelected;
  final List<DrawDate>? drawDates;

  DateDropdown(
      {super.key,
      this.drawUid,
      required this.drawDates,
      required this.onDateSelected});

  @override
  State<DateDropdown> createState() => _DateDropdownState();
}

class _DateDropdownState extends State<DateDropdown> {
  ApiService apiService = ApiService();
  String? selectedValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(DateDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.drawDates != oldWidget.drawDates) {
      setState(() {
        selectedValue = null; // Reset selectedValue
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            CustomText(
              txt: 'Select Date',
              fntSize: 16,
            ),
          ],
        ),
        items: [
          DropdownMenuItem<String>(
            value: 'ALL',
            child: CustomText(
              txt: 'Select ALL',
              fntSize: 16,
            ),
          ),
          // Add the drawDates items
          ...widget.drawDates!.map((DrawDate item) {
            String formattedDate = DateFormat('dd-MMM-yyyy').format(item.date);
            return DropdownMenuItem<String>(
              value: item.drawUid,
              child: CustomText(
                txt: formattedDate,
                fntSize: 16,
              ),
            );
          }),
        ],
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
          });
          if (value != null) {
            widget.onDateSelected(value);
          }
        },
        buttonStyleData: ButtonStyleData(
          height: 60,
          width: 180,
          padding: EdgeInsets.only(left: 20, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: Colors.white,
            ),
            color: Color(0xFF2EC4B6),
          ),
          elevation: 3,
        ),
        iconStyleData: IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 30,
          iconEnabledColor: Colors.white,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF2EC4B6)
            ,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: Radius.circular(20),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
            thumbColor: MaterialStateProperty.all<Color>(Color(0xFFFFFFFF)), // Change the scrollbar color
            trackColor: MaterialStateProperty.all<Color>(Colors.grey),
          ),
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 40, right: 14),
        ),
      )),
    );
  }
}
