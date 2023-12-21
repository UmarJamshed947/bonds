import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

//Draw dropdown

List<String> draw = <String>['select', '200', '1500','100', '200', '1500','100', '200', '1500','100', '200', '1500', '200', '1500','100', '200', '1500','100', '200',];

class Drawdropdown extends StatefulWidget {
  @override
  State<Drawdropdown> createState() => _DrawdropdownState();
}

class _DrawdropdownState extends State<Drawdropdown> {
  String dropdownValue = draw.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: 150,
      child: DropdownMenu<String>(
        menuHeight: 200,
        menuStyle: MenuStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
              side: BorderSide(color: Colors.blueAccent), // Adjust the border color
            ),
          ),
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey.shade300),

        ),


        // menuStyle: MenuStyle(
        //   backgroundColor: MaterialStateProperty.resolveWith<Color?>(
        //         (Set<MaterialState> states) {
        //       if (states.contains(MaterialState.focused)) {
        //         return Theme.of(context).colorScheme.primary.withOpacity(0.5);
        //       }
        //       return null; // Use the component's default.
        //     },
        //   ),
        // ),

        label: Text("Draw"),
        initialSelection: draw.first,
        onSelected: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: draw.map<DropdownMenuEntry<String>>((String value) {
          return DropdownMenuEntry<String>(value: value, label: value);
        }).toList(),


      ),
    );
  }
}

///////////////////////////////////////////////////////////////

// class Drawdropdown extends StatefulWidget {
//   const Drawdropdown({super.key});
//
//   @override
//   State<Drawdropdown> createState() => _DrawdropdownState();
// }
//
// class _DrawdropdownState extends State<Drawdropdown> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.transparent,
//       width: 150,
//       child: DropdownSearch<String>(
//         popupProps: PopupProps.menu(
//           showSelectedItems: false,
//           disabledItemFn: (String s) => s.startsWith('I'),
//         ),
//         items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
//         dropdownDecoratorProps: DropDownDecoratorProps(
//           dropdownSearchDecoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.white, width: 2.0),
//             ),
//             labelText: "Date",
//             labelStyle: TextStyle(color: Colors.white),
//             hintText: "select",
//
//           ),
//         ),
//         onChanged: print,
//         selectedItem: "select",
//       ),
//     );
//   }
// }
