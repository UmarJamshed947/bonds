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
              fntSize: 13,
            ),
          ],
        ),
        items: [
          DropdownMenuItem<String>(
            value: 'ALL',
            child: CustomText(
              txt: 'Select ALL',
              fntSize: 13,
            ),
          ),
          // Add the drawDates items
          ...widget.drawDates!.map((DrawDate item) {
            String formattedDate = DateFormat('dd-MMM-yyyy').format(item.date);
            return DropdownMenuItem<String>(
              value: item.drawUid,
              child: CustomText(
                txt: formattedDate,
                fntSize: 13,
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
          width: 160,
          padding: EdgeInsets.only(left: 20, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.teal.shade500,
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
          maxHeight: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.teal,
          ),
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
      )),
    );
  }
}
