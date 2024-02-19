import 'package:bonds/widgets/draw_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:bonds/widgets/card_widget.dart';
import 'package:bonds/widgets/drawdropdown_widget.dart';
import 'package:bonds/widgets/dropdown_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D6198), // Dark Blue
        leading: Icon(Icons.menu),
        title: Text(
          "Dashboard",
          textAlign: TextAlign.center,
        ),
      ),
      body:
      Stack(
        children: [
          Container(
            height: 200,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.grey[500],
              // gradient: LinearGradient(
              //   colors: [Color(0xFF87ABE7), Color(0xFF3A77BB)], // Blue Gradient
              // ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child:
            Column(
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    DrawDropdown(onDrawSelected: (String? value) {  },),
                    DrawDropdown(onDrawSelected: (String? value) {  },),
                  ],
                ),
                SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    hintText: 'Search draw numbers',
                    labelText: "Search Numbers",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: GoogleFonts.nunito(color: Colors.black),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 180),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    CardWidget(
                      txt: "Draw Search",
                      icon: Icons.search,
                      color: Color(0xFF2ECC71), // Green
                    ),
                    CardWidget(
                      txt: "Download Draw",
                      icon: Icons.file_download,
                      color: Color(0xFF3498DB), // Blue
                    ),
                    CardWidget(
                      txt: "Schedules",
                      icon: Icons.event,
                      color: Color(0xFFE67E22), // Orange
                    ),
                    CardWidget(
                      txt: "Security Features",
                      icon: Icons.security,
                      color: Color(0xFF9B59B6), // Purple
                    ),
                    CardWidget(
                      txt: "Denominations",
                      icon: Icons.attach_money_outlined,
                      color: Color(0xFF1ABC9C), // Turquoise
                    ),
                    CardWidget(
                      txt: "Premium Bonds",
                      icon: Icons.star,
                      color: Color(0xFFE74C3C), // Red
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
