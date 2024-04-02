import 'package:bonds/controller/ApiService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Search_Bond.dart';

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
        backgroundColor: Colors.teal.shade600,
        title:  Text('Search Results'),
      ),
      body: Container(
        color: Colors.teal,
        child: FutureBuilder<List<SearchBond>>(
          future: apiService.fetchSearchBondData(prizeBondTypeUid, drawDateUid, prizeBond),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return  Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return  Center(
                child: Text('No results found.'),
              );
            } else {
              List<SearchBond> searchResults = snapshot.data!;
              return ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  SearchBond searchBond = searchResults[index];
                  return Padding(
                    padding:  EdgeInsets.only(top: 15, left: 5, right: 5),
                    child: Card(
                      color: Colors.teal.shade100,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                          padding:  EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                   Text(
                                    'Prize Category:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.blue, // Set your desired color
                                    ),
                                  ),
                                   SizedBox(width: 20),
                                  Text(
                                    searchBond.prize,
                                    style:  TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.red, // Set your desired color
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                   Text(
                                    'Bond Number:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.blue, // Set your desired color
                                    ),
                                  ),
                                   SizedBox(width: 26),
                                  Text(
                                    searchBond.prizeBondNumber,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.red, // Set your desired color
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Prize Amount:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.blue, // Set your desired color
                                    ),
                                  ),
                                   SizedBox(width: 28),
                                  Text(
                                    '${searchBond.prizeAmount}',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.red, // Set your desired color
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 8),
                              Row(
                                children: [
                                   Text(
                                    'Draw Place:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.blue, // Set your desired color
                                    ),
                                  ),
                                 SizedBox(width: 42),
                                  Text(
                                    searchBond.heldAt,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.red, // Set your desired color
                                    ),
                                  ),
                                ],
                              ),
                             SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    'Draw Number:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.blue, // Set your desired color
                                    ),
                                  ),
                                   SizedBox(width: 28),
                                  Text(
                                    searchBond.drawNumber,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.red, // Set your desired color
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(height: 8),
                              Row(
                                children: [
                                   Text(
                                    'Draw Date:',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.blue, // Set your desired color
                                    ),
                                  ),
                                 SizedBox(width: 48),
                                  Text(
                                    DateFormat('dd MMMM yyyy')
                                        .format(searchBond.drawDate),
                                    style:  TextStyle(
                                      fontFamily: 'Poppins',
                                      color:
                                          Colors.red, // Set your desired color
                                    ),
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
