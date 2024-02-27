import 'package:bonds/widgets/widget.dart';
import 'package:flutter/material.dart';

class Drawsearch extends StatefulWidget {
  const Drawsearch({super.key});

  @override
  State<Drawsearch> createState() => _DrawsearchState();
}

class _DrawsearchState extends State<Drawsearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade600,
        title: const SizedBox(
          height: 100,
          width: 100,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.orangeAccent,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          color: Colors.green,
                      child: const DrawDropdown(items: [
                        'umar','afras','usman','ali'
                      ],
                        buttonColor: Colors.red,
                        dropdownIcon: Icons.arrow_downward,
                        buttonText: 'select draw',
                        buttonHeight: 60,
                        buttonWidth: 400,


                        ),)),
                  Expanded(child: Container(color: Colors.blue)),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.red,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.yellow)),
                Expanded(child: Container(color: Colors.greenAccent)),
              ],
            ),
          )),
          Expanded(
              child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(child: Container(color: Colors.brown)),
                Expanded(child: Container(color: Colors.pinkAccent)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
