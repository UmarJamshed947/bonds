import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/Search_Bond.dart';
import '../Views/Search_Result.dart';
import '../controller/ApiService.dart';

class SearchWidget extends StatefulWidget {
  final String dateUid, prizeBondTypeUid;

  const SearchWidget(
      {super.key, required this.dateUid, required this.prizeBondTypeUid});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  Future<void> searchdata(
      String prizeBondTypeUid, String drawuid, String prizeBond) async {
    print("Fetching UID: $drawuid");
    print("Fetching textD: $prizeBond");
    if (widget.dateUid != null) {
      searchdate = await apiService.fetchSearchBondData(
          prizeBondTypeUid, drawuid, prizeBond);
      print("Fetched dates: $searchdate");
    }
  }

  ApiService apiService = ApiService();
  List<SearchBond> searchdate = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      width: 410,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          hintText: 'Search draw numbers',
          labelText: "Search Numbers",
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: GoogleFonts.nunito(color: Colors.white),
          prefixIcon: const Icon(Icons.search, color: Colors.white),
          suffixIcon: GestureDetector(
            onTap: () async {
              searchdata(widget.prizeBondTypeUid, widget.dateUid,
                  _searchController.text.trim());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchResult(
                    prizeBondTypeUid: widget.prizeBondTypeUid,
                    drawuid: widget.dateUid,
                    prizeBond: _searchController.text.trim(),
                  ),
                ),
              );
            },
            child: const Icon(Icons.arrow_circle_right_outlined,
                color: Colors.white, size: 30),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white, width: 4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.white, width: 2),
          ),
        ),
      ),
    );
  }
}
