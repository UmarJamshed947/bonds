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
        backgroundColor: Color(0xFF2EC4B6),
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
          color: Color(0xFF2EC4B6),
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
              return Center(
                child: Text('No results found.'),
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
                      color: Colors.teal.shade100,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    txt: 'Prize Category:',
                                    clr: Color(0xFF333333),
                                  ),
                                  CustomText(
                                    txt: searchBond.prize,
                                    clr: Color(0xFF333333),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    txt: 'Bond Number:',
                                    clr: Color(0xFF333333),
                                  ),
                                  CustomText(
                                    txt: searchBond.prizeBondNumber,
                                    clr: Color(0xFF333333),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    txt: 'Prize Amount:',
                                    clr: Colors.red,
                                  ),
                                  CustomText(
                                    txt: '${searchBond.prizeAmount}',
                                    clr: Colors.red,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    txt: 'Draw Place:',
                                    clr: Color(0xFF333333),
                                  ),
                                  CustomText(
                                    txt: searchBond.heldAt,
                                    clr: Color(0xFF333333),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    txt: 'Draw Number:',
                                    clr: Color(0xFF333333),
                                  ),
                                  CustomText(
                                    txt: searchBond.drawNumber,
                                    clr: Color(0xFF333333),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    txt: 'Draw Date:',
                                    clr: Color(0xFF333333),
                                  ),
                                  CustomText(
                                    txt: DateFormat('dd MMMM yyyy')
                                        .format(searchBond.drawDate),
                                    clr: Color(0xFF333333),
                                  ),
                                ],
                              ),
                            ],
                          )),
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
