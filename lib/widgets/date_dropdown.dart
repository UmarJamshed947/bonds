import 'package:bonds/Models/Draw_Date.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class DateDropdown extends StatefulWidget {
  String? drawUid;
  final ValueChanged<String?> onDateSelected;

  DateDropdown({this.drawUid, required this.onDateSelected});

  @override
  State<DateDropdown> createState() => _DateDropdownState();
}

class _DateDropdownState extends State<DateDropdown> {
  ApiService apiService = ApiService();
  List<DrawDate> drawdate = [];
  String? selectedValue;

  @override
  void initState() {
    super.initState();

    // print("Initial drawdate: $drawdate");
    // print("Initial drawUid: ${widget.drawUid}");
    //   if (widget.drawdate != null) {
    //     drawdate = widget.drawdate!;
    //   } else {
    //
    //   }
  }

  Future<void> fetchData() async {
    //print("Fetching dates for draw UID: ${widget.drawUid}");
    if (widget.drawUid != null) {
      drawdate = await apiService.fetchDrawDateData(widget.drawUid!);
      //print("Fetched dates: $drawdate");
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Material(
      child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
        isExpanded: true,
        hint: Row(
          children: [
            Expanded(
              child: Text(
                'Select Date',
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
        items: drawdate.map((DrawDate item) {
          String formattedDate = DateFormat('dd-MM-yyyy').format(item.date);
          return DropdownMenuItem<String>(
            value: formattedDate,
            child: Text(
              formattedDate,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }).toList(),
        value: selectedValue,
        onChanged: (String? value) {
          setState(() {
            selectedValue = value;
            print(selectedValue);
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
            borderRadius: BorderRadius.circular(10),
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
      )),
    );
  }
}
