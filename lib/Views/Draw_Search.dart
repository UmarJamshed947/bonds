import 'package:bonds/Widgets/date_dropdown.dart';
import 'package:bonds/Widgets/draw_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../Controller/ApiService.dart';
import '../Models/Draw_Date.dart';
import '../Models/Range_Search.dart';
import '../Models/Search_Bond.dart';
import 'Rangesearch_Results.dart';
import 'Search_Result.dart';

class Drawsearch extends StatefulWidget {
  @override
  State<Drawsearch> createState() => _DrawsearchState();
}

class _DrawsearchState extends State<Drawsearch> {
  ApiService apiService = ApiService();
  String? drawDateUid;
  String? bondTypeUid;

  List<DrawDate> drawDates = [];

  Future<void> fetchData() async {
    //print("Fetching dates for draw UID: ${widget.drawUid}");
    if (drawDateUid != null) {
      List<DrawDate> newDrawDates =
          await apiService.fetchDrawDateData(drawDateUid!);
      setState(() {
        drawDates = newDrawDates;
      });
    }
  }

/*  Future<void> searchdata() async {
    print("Fetching UID: ${widget.drawUid}");
    print("Fetching textD: ${_fromRangeController.text}");

    if (widget.drawUid != null && widget.firstNumber != null && widget.lastNumber != null) {
      // Ensure that widget.firstNumber and widget.lastNumber are not null
      int firstNumber = _fromRangeController.text as int;
      int lastNumber = _toRangeController.text as int;

      // Fetching search data using ApiService
     await apiService.fetchRangeSearchData(
        widget.drawUid!,
        firstNumber,
        lastNumber,
      );
      //rangeSearch = [result];
      //print("Fetched dates: $rangeSearch");
    }
  }*/


  Future<List<SearchBond>> searchdata(
      String prizeBondTypeUid, String drawuid, String prizeBond) async {
    print("Fetching UID: $drawuid");
    print("Fetching textD: $prizeBond");
    if (drawuid != null && prizeBond != null) {
      return apiService.fetchSearchBondData(prizeBondTypeUid, drawuid, prizeBond);
    } else {
      return [];
    }
  }

  TextEditingController _fromRangeController = TextEditingController();
  TextEditingController _toRangeController = TextEditingController();
  TextEditingController _randomRangeController = TextEditingController();
  // final RoundedLoadingButtonController _searchBtnController = RoundedLoadingButtonController();

  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade600,
        title: Text(
          'Draw Search',
          style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 350,
                    child: DrawDropdown(
                      onDrawSelected: (drawUid) {
                        setState(() {
                          drawDateUid = drawUid;
                          bondTypeUid = null;
                          drawDates = [];
                          print("selectedbond");
                          print(drawUid);
                        });
                        fetchData();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 350,
                    child: DateDropdown(
                      drawUid: drawDateUid,
                      drawDates: drawDates,
                      onDateSelected: (date) {
                        setState(() {
                          bondTypeUid = date;
                          print("selectedValue");
                          print(bondTypeUid);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              Colors.white, // Change non-active color here
                        ),
                        child: Radio(
                          value: 0,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value as int;
                            });
                          },
                          activeColor: Colors.white,
                          hoverColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      Text(
                        'From/To',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ), // Change non-active color here

                        child: Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value as int;
                            });
                          },
                          activeColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      Text(
                        'Misc.Numbers',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (selectedRadio == 0)
                    Column(
                      children: [
                        Text(
                          "Range Search",
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1),
                        ),
                        Text(
                          "Search For All Numbers in Range EXAMPLE: From: 122000 To: 122099",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'From:',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _fromRangeController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2),
                                    ),
                                    labelText: "Search Numbers",
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintStyle:
                                        GoogleFonts.nunito(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'To:',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 1),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: _toRangeController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 4),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2),
                                    ),
                                    labelText: "Search Numbers",
                                    labelStyle: TextStyle(color: Colors.white),
                                    hintStyle:
                                        GoogleFonts.nunito(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (selectedRadio == 1)
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              'Miscel.Numbers:',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _randomRangeController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                labelText:
                                    "EXAMPLE: 123455,556879,445632,122354",
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle:
                                    GoogleFonts.nunito(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // MaterialButton(
            //   color: Colors.teal.shade900,
            //   // controller: _searchBtnController,
            //   onPressed: () {
            //     //searchdata();
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => RangeSearchResult(
            //           //drawUid: selectedDate.toString(),
            //           drawUid: selectedDrawUid!,
            //           firstNumber: int.parse(
            //               _fromRangeController.text.trim().toString()),
            //           lastNumber:
            //               int.parse(_toRangeController.text.trim().toString()),
            //           //prizeBondTypeUid: selectedDrawUid!,
            //           prizeBondTypeUid: selectedDate.toString(),
            //         ),
            //       ),
            //     );
            //   },
            //   child: Text(
            //     "Search",
            //     style: GoogleFonts.poppins(
            //         color: Colors.white,
            //         fontSize: 18,
            //         fontWeight: FontWeight.w600,
            //         letterSpacing: 1),
            //   ),
            // ),
            MaterialButton(
              color: Colors.teal.shade900,
              onPressed: () async {
                if (selectedRadio == 0) {
                  // Perform range search
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RangeSearchResult(
                        drawUid: drawDateUid!,
                        firstNumber: int.parse(_fromRangeController.text.trim()),
                        lastNumber: int.parse(_toRangeController.text.trim()),
                        prizeBondTypeUid: bondTypeUid.toString(),
                      ),
                    ),
                  );
                } else if (selectedRadio == 1) {
                  // Perform miscellaneous numbers search
                  String prizeBondTypeUid = bondTypeUid.toString();
                  String prizeBond = _randomRangeController.text.trim();
                  if (prizeBond.isNotEmpty) {
                    // Call the searchdata function
                    List<SearchBond> searchResults = await searchdata(prizeBondTypeUid, drawDateUid!, prizeBond);
                    // Handle the search results

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResult(
                          prizeBondTypeUid: drawDateUid!,
                          drawDateUid: prizeBondTypeUid,
                          prizeBond: prizeBond,
                        ),
                      ),
                    );
                  }
                }
              },
              child: Text(
                "Search",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
