import 'package:bonds/Models/Bond_Type.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'customtext.dart';

class DrawDropdown extends StatefulWidget {
  final ValueChanged<String?> onDrawSelected;

  const DrawDropdown({super.key, required this.onDrawSelected});

  @override
  State<DrawDropdown> createState() => _DrawDropdownState();
}

class _DrawDropdownState extends State<DrawDropdown> {
  ApiService apiService = ApiService();
  List<BondType> bondTypes = [];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    await apiService.fetchBondTypeData().then((value) {
      setState(() {
        bondTypes = value;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint:  Row(
            children: [
              Expanded(
                child: CustomText(
                  txt:'Select Draw',
                  fntSize: 16,
                  // style: TextStyle(
                  //   fontSize: 14,
                  //   fontWeight: FontWeight.bold,
                  //   color: Colors.white,
                  // ),
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: bondTypes
              .map((BondType item) => DropdownMenuItem<String>(
                    value: item.prizeBondTypeUid,
                    child: CustomText(
                      txt:item.name,
                      fntSize: 16,


                    ),

                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) async {
            setState(() {
              selectedValue = value;
              print(selectedValue);
            });
            if (value != null) {
              // Pass the selected draw UID to the DateDropdown widget
              widget.onDrawSelected(value);
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
              color: Color(0xFF2196F3),
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
              color: Color(0xFF2196F3)
              ,
            ),
            //offset: const Offset(-20, 0),
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
        ),
      ),
    );
  }
}
