import 'dart:ui';

import 'package:bonds/Models/Draw_Date.dart';
import 'package:bonds/Views/Schedule_Screen.dart';
import 'package:bonds/Views/Security_Features.dart';
import 'package:bonds/Views/denominations.dart';
import 'package:bonds/Views/table.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:bonds/widgets/date_dropdown.dart';
import 'package:bonds/widgets/draw_dropdown.dart';
import 'package:bonds/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:bonds/widgets/card_widget.dart';
import '../Widgets/customtext.dart';
import 'Draw_Search.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  ApiService apiService = ApiService();
  String? selectedDrawUid;
  String? selectedDate;
  List<DrawDate> drawDates = [];

  Future<void> fetchData() async {
    //print("Fetching dates for draw UID: ${widget.drawUid}");
    if (selectedDrawUid != null) {
      List<DrawDate> newDrawDates =
          await apiService.fetchDrawDateData(selectedDrawUid!);
      setState(() {
        drawDates = newDrawDates;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xFF2EC4B6),
        title: CustomText(txt: "Prize Bonds", fntSize: 22),
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
        color: Color(0xFFCBF3F0),
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Color(0xFFFAD585), Color(0xFFF47A7D)])),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DrawDropdown(
                  onDrawSelected: (drawUid) {
                    setState(() {
                      selectedDrawUid = drawUid;
                      selectedDate = null;
                      drawDates = [];
                    });
                    fetchData();
                  },
                ),
                DateDropdown(
                  drawUid: selectedDrawUid,
                  drawDates: drawDates,
                  onDateSelected: (date) {
                    setState(() {
                      selectedDate = date;
                      print("selectedValue");
                      print(selectedDate);
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          SearchWidget(
              dateUid: selectedDate ?? '',
              prizeBondTypeUid: selectedDrawUid ?? ''),
          SizedBox(height: 40),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: 60),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFB2E6E0),


                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 12,
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  children: [
                    CardWidget(
                      txt: "Draw-Search",
                      icon: Icons.search,
                      color: Color(0xFF2EC4B6),

                      onTap: () {
                        print("Draw-Search card tapped");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Drawsearch()));

                      },
                      //color: Color(0xFF2ECC71), // Green
                    ),
                    /*CardWidget(
                          txt: "Downloads",
                          icon: Icons.file_download,
                          color: Colors.teal,
                          onTap: (){
                            print("Downloads card tapped");
                          },
                          // color: Color(0xFF3498DB), // Blue
                        ),*/
                    CardWidget(
                      txt: "Schedules",
                      icon: Icons.event,
                      color: Color(0xFF2EC4B6),

                      onTap: () {
                        print("Draw-Search card tapped");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TableScreen()));
                      },
                      // color: Color(0xFFE67E22), // Orange
                    ),
                    CardWidget(
                      txt: "Sec-Features",
                      icon: Icons.security,
                      color: Color(0xFF2EC4B6),

                      onTap: () {
                        print("Draw-Search card tapped");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecurityFeatures()));
                      },
                      // color: Color(0xFF9B59B6), // Purple
                    ),
                    /*    CardWidget(
                          txt: "Denominations",
                          icon: Icons.attach_money_outlined,
                          color: Colors.teal,
                          // color: Color(0xFF1ABC9C), // Turquoise
                        ),*/
                    CardWidget(
                      txt: "Denominations",
                      icon: Icons.attach_money_outlined,
                      color: Color(0xFF2EC4B6),
    onTap: () {
      print("Draw-Search card tapped");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Denominations()));

      // color: Color(0xFFE74C3C), // Red
    } ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
