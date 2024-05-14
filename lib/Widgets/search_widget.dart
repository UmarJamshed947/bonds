/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Search_Bond.dart';
import '../Views/singlesearch_result.dart';
import '../controller/ApiService.dart';
import 'customtext.dart';

class SearchWidget extends StatefulWidget {

  final String dateUid, prizeBondTypeUid;

  SearchWidget(
      {super.key,  required this.dateUid,  required this.prizeBondTypeUid});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  // Controller for handling text input
  final TextEditingController _searchController = TextEditingController();

  // Function for searching data
  Future<void> searchdata(
      String prizeBondTypeUid, String drawuid, String prizeBond) async {
    print("Fetching UID: $drawuid");
    print("Fetching textD: $prizeBond");
    if (widget.dateUid != null) {
      // Fetching search data using ApiService
      searchdate = await apiService.fetchSearchBondData(
          prizeBondTypeUid, drawuid, prizeBond);
      print("Fetched dates: $searchdate");
    }
  }

  // Instance of ApiService for making API calls
  ApiService apiService = ApiService();
  // List to store the search results
  List<SearchBond> searchdate = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: 450,
      child: TextField(
        style: TextStyle(color: Color(0xFF2196F3),fontSize: 14),
        cursorColor: Color(0xFF2196F3),
        controller: _searchController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2196F3)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFF2196F3), width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //hintText: 'Search draw numbers',
          labelText: "Search Numbers",
          labelStyle: TextStyle(color: Color(0xFF2196F3),fontSize: 16),

          hintStyle: GoogleFonts.nunito(color: Colors.white,fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Color(0xFF2196F3),size: 30),
          suffixIcon: GestureDetector(
            onTap: () async {

              if ( widget.prizeBondTypeUid.isNotEmpty) {
                searchdata(widget.prizeBondTypeUid, widget.dateUid,
                    _searchController.text.trim());


                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SearchResult(
                          prizeBondTypeUid: widget.prizeBondTypeUid,
                          drawDateUid: widget.dateUid,
                          prizeBond: _searchController.text.trim(),
                        ),
                  ),
                );
              }
              else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: CustomText(txt: 'Warning', clr: Colors.red),
                    content: Text('To proceed, please ensure all fields are filled out.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK',style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),

              );}
            },
            child: Icon(Icons.arrow_circle_right_outlined,
                color: Color(0xFF2196F3), size: 30),
          ),
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Search_Bond.dart';
import '../Views/singlesearch_result.dart';
import '../controller/ApiService.dart';
import 'customtext.dart';

class SearchWidget extends StatefulWidget {
  final String dateUid, prizeBondTypeUid;

  SearchWidget(
      {super.key, required this.dateUid, required this.prizeBondTypeUid});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // Controller for handling text input
  final TextEditingController _searchController = TextEditingController();

  // Function for searching data
  Future<void> searchdata(
      String prizeBondTypeUid, String drawuid, String prizeBond) async {
    print("Fetching UID: $drawuid");
    print("Fetching textD: $prizeBond");
    searchdate = await apiService.fetchSearchBondData(
        prizeBondTypeUid, drawuid, prizeBond);
    print("Fetched dates: $searchdate");
  }

  // Instance of ApiService for making API calls
  ApiService apiService = ApiService();

  // List to store the search results
  List<SearchBond> searchdate = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),

      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyle(color: Color(0xFF2196F3), fontSize: 14),
              cursorColor: Color(0xFF2196F3),
              controller: _searchController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9,]')),
              ],
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF2196F3)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFF2196F3), width: 4),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Color(0xFF2196F3), width: 2),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                labelText: "Search Numbers",
                labelStyle: TextStyle(color: Color(0xFF2196F3), fontSize: 16),
                hintStyle:
                    GoogleFonts.nunito(color: Colors.white, fontSize: 14),
                prefixIcon:
                    Icon(Icons.search, color: Color(0xFF2196F3), size: 30),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              if (widget.prizeBondTypeUid.isEmpty ||
                  widget.dateUid == null ||
                  _searchController.text.trim().isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Warning', style: TextStyle(color: Colors.red)),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.prizeBondTypeUid.isEmpty)
                          Text('Please select a draw from the dropdown.'),
                        if (widget.dateUid == null)
                          Text('Please select a date from the dropdown.'),
                        if (_searchController.text.trim().isEmpty)
                          Text('The search field is empty.'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('OK', style: TextStyle(fontSize: 20)),
                      ),
                    ],
                  ),
                );
              } else {
                // Proceed with the search
                searchdata(widget.prizeBondTypeUid, widget.dateUid,
                    _searchController.text.trim());

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchResult(
                      prizeBondTypeUid: widget.prizeBondTypeUid,
                      drawDateUid: widget.dateUid,
                      prizeBond: _searchController.text.trim(),
                    ),
                  ),
                );
              }
            },
            child: Container(
              height: 56, // Adjusted height
              alignment: Alignment.center, // Aligned text in center
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF2196F3),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Search',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
