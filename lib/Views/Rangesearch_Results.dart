import 'package:bonds/Models/Range_Search.dart';
import 'package:bonds/Views/Draw_Search.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Widgets/customtext.dart';



class RangeSearchResult extends StatelessWidget {
  String drawUid;
  int firstNumber;
  int lastNumber;
  String prizeBondTypeUid;

  // Constructor to initialize parameters
  RangeSearchResult(
      {required this.drawUid,
      required this.firstNumber,
      required this.lastNumber,
      required this.prizeBondTypeUid});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF2EC4B6),

        title: CustomText(txt: "Searched Results", fntSize: 22),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Drawsearch()));
          },
        ),
      ),
      body: Container(
        color: Color(0xFF2EC4B6),
        child: FutureBuilder<List<RangeSearch>>(
          future: apiService.fetchRangeSearchData(
            drawUid,
            firstNumber,
            lastNumber,
            prizeBondTypeUid,
          ),
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
              List<RangeSearch> searchResults = snapshot.data!;
              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  RangeSearch rangeSearch = searchResults[index];
                  return Padding(
                    padding: EdgeInsets.only(top: 15, left: 5, right: 5),
                    child: Card(
                      color: Colors.teal.shade100,
                      elevation: 3,
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
                                    txt: rangeSearch.prize,
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
                                    txt: rangeSearch.prizeBondNumber,
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
                                    txt: '${rangeSearch.prizeAmount}',
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
                                    txt: rangeSearch.heldAt,
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
                                    txt: rangeSearch.drawNumber,
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
                                        .format(rangeSearch.drawDate),
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
