import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 100,
      width: 450,
      child: TextField(
        style: TextStyle(color: Color(0xFF333333),fontSize: 16,fontWeight: FontWeight.bold),
        cursorColor: Color(0xFF2EC4B6),
        controller: _searchController,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'^[\d,]*$')),
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF2EC4B6)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFF2EC4B6), width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Color(0xFF2EC4B6), width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          //hintText: 'Search draw numbers',
          labelText: "Search Numbers",
          labelStyle: TextStyle(color: Color(0xFF333333),fontSize: 16),

          hintStyle: GoogleFonts.nunito(color: Colors.white,fontSize: 14),
          prefixIcon: Icon(Icons.search, color: Color(0xFF2EC4B6),size: 30),
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
                color: Color(0xFF2EC4B6), size: 30),
          ),
        ),
      ),
    );
  }
}
