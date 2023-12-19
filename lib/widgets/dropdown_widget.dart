import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

// class Dropdown extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<String>(
//       value: '15-20-2023', // Set the initial value
//       items: <String>[
//         '15-20-2023',
//         '15-5-2023',
//         '10-2-2022',
//       ].map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//       onChanged: (String? newValue) {
//         // Handle dropdown value change
//       },
//     );
//   }
// }

// Date Dropdown

List<String> list = <String>['15-20-2023', '10-05-2020', '15-04-2021'];

class Datedropdown extends StatefulWidget {
  @override
  State<Datedropdown> createState() => _DrawdropdownState();
}

class _DrawdropdownState extends State<Datedropdown> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: DropdownMenu<String>(
        menuStyle: MenuStyle(),
        initialSelection: list.first,
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),
      ),
    );
  }
}

// class Datedropdown extends StatefulWidget {
//   const Datedropdown({super.key});
//
//   @override
//   State<Datedropdown> createState() => _DatedropdownState();
// }
//
// class _DatedropdownState extends State<Datedropdown> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       child: DropdownSearch<String>(
//         popupProps: PopupProps.menu(
//           showSelectedItems: true,
//           disabledItemFn: (String s) => s.startsWith('I'),
//         ),
//         items: ["100", "200", "750", '1500'],
//         dropdownDecoratorProps: DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.white, width: 2.0),
//             ),
//             labelText: "Bonds",
//             labelStyle: TextStyle(color: Colors.white),
//             //hintText: "country in menu mode",
//           ),
//         ),
//         onChanged: print,
//         selectedItem: "Select",
//
//       ),
//     );
//   }
// }


