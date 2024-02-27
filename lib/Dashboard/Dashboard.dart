import 'package:bonds/controller/ApiService.dart';
import 'package:bonds/widgets/date_dropdown.dart';
import 'package:bonds/widgets/draw_dropdown.dart';
import 'package:bonds/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:bonds/widgets/card_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  ApiService apiService = ApiService();
  String? selectedDrawUid;
  String? selectedDate;
  String? selectedDateid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal.shade600,
          title: Container(
            height: 100,
            width: 100,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Colors.teal,
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [Color(0xFFFAD585), Color(0xFFF47A7D)])),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DrawDropdown(
                      onDrawSelected: (drawUid) {
                        setState(() {
                          selectedDrawUid = drawUid;
                        });
                      },
                    ),
                    DateDropdown(
                      drawUid: selectedDrawUid,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SearchWidget(
                dateUid: selectedDate,
                onDateidSelected: (String? value) {
                  setState(() {
                    selectedDateid = value;
                  });
                },
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      children: [
                        CardWidget(
                          txt: "Draw-Search",
                          icon: Icons.search,
                          color: Colors.teal,
                          //color: Color(0xFF2ECC71), // Green
                        ),
                        CardWidget(
                          txt: "Downloads",
                          icon: Icons.file_download,
                          color: Colors.teal,
                          // color: Color(0xFF3498DB), // Blue
                        ),
                        CardWidget(
                          txt: "Schedules",
                          icon: Icons.event,
                          color: Colors.teal,
                          // color: Color(0xFFE67E22), // Orange
                        ),
                        CardWidget(
                          txt: "Sec-Features",
                          icon: Icons.security,
                          color: Colors.teal,
                          // color: Color(0xFF9B59B6), // Purple
                        ),
                        CardWidget(
                          txt: "Denominations",
                          icon: Icons.attach_money_outlined,
                          color: Colors.teal,
                          // color: Color(0xFF1ABC9C), // Turquoise
                        ),
                        CardWidget(
                          txt: "Prem-Bonds",
                          icon: Icons.star,
                          color: Colors.teal,
                          // color: Color(0xFFE74C3C), // Red
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
