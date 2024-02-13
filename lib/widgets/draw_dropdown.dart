import 'package:bonds/Models/BondTypeModel.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:bonds/widgets/date_dropdown.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/BondDrawDate.dart';

class DrawDropdown extends StatefulWidget {
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
  Future<void> saveSelectedDrawUid(String drawUid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('selectedDrawUid', drawUid);
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Row(
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
          items: bondTypes
              .map((BondType item) => DropdownMenuItem<String>(
            value: item.name,
            child: Text(
              item.name,
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
          onChanged: (String? value) async {
            setState(() {
              selectedValue = value;
              print(selectedValue);
            });
            if (value != null) {
              // Fetch additional data for the selected item
              BondType selectedBondType =
              bondTypes.firstWhere((bondType) => bondType.name == value);
              print(selectedBondType.prizeBondTypeUid);
              // Navigate to the next screen and pass the selected item data
              // Fetch data for the selected item
              List<DrawDate> drawdate = await apiService.fetchDrawDateData(selectedBondType.prizeBondTypeUid);
              // Save the selected drawuid in shared preferences
              await saveSelectedDrawUid(selectedBondType.prizeBondTypeUid);
              //DateDropdown.of(context)?.updateData(drawdate);

              // Get.to(
              //   DateDropdown(
              //     drawuid: selectedBondType.prizeBondTypeUid,
              //     drawdate:drawdate,
              //     // Pass other data if needed
              //     //amount: selectedBondType.amount,
              //     //firstPrize: selectedBondType.firstPrize,
              //     //secondPrize: selectedBondType.secondPrize,
              //  //   thirdPrize: selectedBondType.thirdPrize,
              //    // premium: selectedBondType.premium,
              //   ),
              // );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DateDropdown(
                    drawuid: selectedBondType.prizeBondTypeUid,
                    drawdate: drawdate,
                  ),
                ),
              );

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
        ),
      ),
    );
  }
}
