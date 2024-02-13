import 'package:bonds/controller/ApiService.dart';
import 'package:bonds/widgets/date_dropdown.dart';
import 'package:bonds/widgets/draw_dropdown.dart';
import 'package:bonds/widgets/two_value_card.dart';
import 'package:flutter/material.dart';
import 'package:bonds/widgets/card_widget.dart';
import 'package:bonds/widgets/drawdropdown_widget.dart';
import 'package:bonds/widgets/dropdown_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {

  ApiService apiService = ApiService();

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

                    DrawDropdown(),
                    DateDropdown(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 100,
                width: 410,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    hintText: 'Search draw numbers',
                    labelText: "Search Numbers",
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: GoogleFonts.nunito(color: Colors.white),
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    suffixIcon: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DateDropdown(

                              ),
                            ),
                          );
                          print("click");
                        },

                        child: Icon(Icons.arrow_circle_right_outlined,color: Colors.white,size: 30)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white, width: 4),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                ),
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
                    padding:  EdgeInsets.all(16),
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
                        ), CardWidget(
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
    // Stack(
    //   children: [
    //     Container(
    //       height: 200,
    //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
    //       decoration: BoxDecoration(
    //         color: Colors.grey[500],
    //         // gradient: LinearGradient(
    //         //   colors: [Color(0xFF87ABE7), Color(0xFF3A77BB)], // Blue Gradient
    //         // ),
    //         borderRadius: BorderRadius.only(
    //           bottomRight: Radius.circular(20),
    //           bottomLeft: Radius.circular(20),
    //         ),
    //       ),
    //       child:
    //       Column(
    //         children: [
    //           Row(
    //             //crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //
    //               DrawDropdown(),
    //               DrawDropdown(),
    //             ],
    //           ),
    //           SizedBox(height: 15),
    //           TextField(
    //             decoration: InputDecoration(
    //               contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    //               hintText: 'Search draw numbers',
    //               labelText: "Search Numbers",
    //               labelStyle: TextStyle(color: Colors.black),
    //               hintStyle: GoogleFonts.nunito(color: Colors.black),
    //               prefixIcon: Icon(Icons.search, color: Colors.black),
    //               border: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(8.0),
    //                 borderSide: BorderSide(color: Colors.black, width: 2),
    //               ),
    //               focusedBorder: OutlineInputBorder(
    //                 borderRadius: BorderRadius.circular(8.0),
    //                 borderSide: BorderSide(color: Colors.black, width: 2),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         margin: EdgeInsets.only(top: 180),
    //         child: Padding(
    //           padding: EdgeInsets.all(15.0),
    //           child: GridView.count(
    //             crossAxisCount: 2,
    //             children: [
    //               CardWidget(
    //                 txt: "Draw Search",
    //                 icon: Icons.search,
    //                 color: Color(0xFF2ECC71), // Green
    //               ),
    //               CardWidget(
    //                 txt: "Download Draw",
    //                 icon: Icons.file_download,
    //                 color: Color(0xFF3498DB), // Blue
    //               ),
    //               CardWidget(
    //                 txt: "Schedules",
    //                 icon: Icons.event,
    //                 color: Color(0xFFE67E22), // Orange
    //               ),
    //               CardWidget(
    //                 txt: "Security Features",
    //                 icon: Icons.security,
    //                 color: Color(0xFF9B59B6), // Purple
    //               ),
    //               CardWidget(
    //                 txt: "Denominations",
    //                 icon: Icons.attach_money_outlined,
    //                 color: Color(0xFF1ABC9C), // Turquoise
    //               ),
    //               CardWidget(
    //                 txt: "Premium Bonds",
    //                 icon: Icons.star,
    //                 color: Color(0xFFE74C3C), // Red
    //               ),
    //
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  }
}
