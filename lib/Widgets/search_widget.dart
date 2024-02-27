import 'package:bonds/screens/Search_Result.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/Search_Bond.dart';
import '../controller/ApiService.dart';

class SearchWidget extends StatefulWidget {
  String? dateUid;
  final ValueChanged<String?> onDateidSelected;

  SearchWidget({this.dateUid,required this.onDateidSelected});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _searchController = TextEditingController();

  Future<void> searchdata(String drawuid, String prizeBond) async {
    print("Fetching UID: ${drawuid}");
    print("Fetching textD: ${prizeBond}");
    if (widget.dateUid != null) {
      searchdate = await apiService.fetchSearchBondData(drawuid,prizeBond);
      print("Fetched dates: $searchdate");
    }
  }

  ApiService apiService = ApiService();
  List<SearchBond> searchdate = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      width: 410,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          hintText: 'Search draw numbers',
          labelText: "Search Numbers",
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: GoogleFonts.nunito(color: Colors.white),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          suffixIcon: GestureDetector(
            onTap: () async {
              searchdata(widget.dateUid!,_searchController.text.trim());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResult(
                    drawuid: widget.dateUid!,
                    prizeBond: _searchController.text.trim(),
                  ),
                ),
              );
            },
            child: Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 30),
          ),
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
    );
  }


}
