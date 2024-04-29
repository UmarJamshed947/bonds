import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/Search_Bond.dart';
import '../Views/Search_Result.dart';
import '../controller/ApiService.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      width: 385,
      child: TextField(
        style: TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        controller: _searchController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white, width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.white, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //hintText: 'Search draw numbers',
          labelText: "Search Numbers",
          labelStyle: TextStyle(color: Colors.white),

          hintStyle: GoogleFonts.nunito(color: Colors.white),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          suffixIcon: GestureDetector(
            onTap: () async {
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
            },
            child: Icon(Icons.arrow_circle_right_outlined,
                color: Colors.white, size: 30),
          ),
        ),
      ),
    );
  }
}
