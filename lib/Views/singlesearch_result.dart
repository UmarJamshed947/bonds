import 'package:bonds/Views/Dashboard.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Search_Bond.dart';
import '../Widgets/customtext.dart';

class SearchResult extends StatelessWidget {
  late final String drawDateUid;
  late final String prizeBond;
  late final String prizeBondTypeUid;

  SearchResult(
      {super.key,
      required this.prizeBondTypeUid,
      required this.drawDateUid,
      required this.prizeBond});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xFF2196F3),
        title: CustomText(txt: 'Search Result', fntSize: 22),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Dashboard()));

          },
        ),
      ),
      body: Container(
          color: Color(0xFFFAF8F8),
        child: FutureBuilder<List<SearchBond>>(
          future: apiService.fetchSearchBondData(
              prizeBondTypeUid, drawDateUid, prizeBond),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return AlertDialog(
                title: Text('No results found.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('OK',style: TextStyle(fontSize: 20),),
                  ),
                ],
              );
            } else {
              List<SearchBond> searchResults = snapshot.data!;
              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  SearchBond searchBond = searchResults[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 15, left: 5, right: 5),
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            colors: [Color(0xFF2196F3), Colors.lightBlueAccent],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: [0.0, 1], // Adjust stops as needed
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: CustomText(
                                txt: searchBond.prizeBondType,

                                clr: Colors.yellowAccent,
                                fntSize: 30,

                              ),
                            ),
                            // Top center: Prize
                            CustomText(
                              txt:searchBond.prize,
                              textAlign: TextAlign.start,

                                clr: Colors.white,
                                fntWeight: FontWeight.normal,
                                fntSize: 24,

                            ),


                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  txt:'Prize Amount: ${searchBond.prizeAmount}/-',

                                    clr: Colors.yellowAccent,
                                  fntSize: 16,
                                  fntWeight: FontWeight.normal,

                                ),
                                SizedBox(height: 2),
                                CustomText(
                                  txt:'Bond Number: ${searchBond.prizeBondNumber}',

                                    clr: Colors.white,
                                  fntSize: 16,
                                  fntWeight: FontWeight.normal,

                                ),
                                SizedBox(height: 2),
                                CustomText(
                                  txt:'Draw Date: ${DateFormat('dd MMMM yyyy').format(searchBond.drawDate)}',

                                    clr: Colors.white,
                                  fntSize: 16,
                                  fntWeight: FontWeight.normal,

                                ),
                              ],
                            ),
                          ],
                        ),
                      ),


                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
