import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [DropdownMenu].

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownMenuApp());

class DropdownMenuApp extends StatelessWidget {
  const DropdownMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(

          backgroundColor: Colors.cyanAccent,
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body: const Center(

          child: DropdownMenuExample(),
        ),
      ),
    );
  }
}

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {


  @override
  Widget build(BuildContext context) {
     return Container(
       width: 150,
       child: DropdownSearch<String>(
         popupProps: PopupProps.menu(
           showSelectedItems: true,
           disabledItemFn: (String s) => s.startsWith('I'),
         ),
         items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
         dropdownDecoratorProps: DropDownDecoratorProps(
           dropdownSearchDecoration: InputDecoration(
             contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
             enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(8),
               borderSide: BorderSide(color: Colors.blue, width: 5.0),
             ),
             labelText: "Menu mode",
             hintText: "country in menu mode",
           ),
         ),
         onChanged: print,
         selectedItem: "Brazil",

       ),
     );
  }
}
