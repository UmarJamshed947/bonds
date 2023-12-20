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

          backgroundColor: Colors.grey,
        appBar: AppBar(title: const Text('DropdownMenu Sample')),
        body:  Center(

          child: DropdownMenuExample(),
        ),
      ),
    );
  }
}


List<String> draw = <String>['select', '200', '1500','100'];

class DropdownMenuExample extends StatefulWidget {
  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = draw.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue), // Set border color
        borderRadius: BorderRadius.circular(8.0), // Set border radius
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 24,
          elevation: 16,
          style: TextStyle(color: Colors.black),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: draw.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

