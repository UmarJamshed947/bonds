import 'package:bonds/controller/ApiService.dart';
import 'package:flutter/material.dart';

import '../Models/Search_Bond.dart';

class SearchResult extends StatelessWidget {
  late final String drawuid;
  late final String prizeBond;

  SearchResult({required this.drawuid, required this.prizeBond});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
      ),
      body: FutureBuilder<List<SearchBond>>(
        future: apiService.fetchSearchBondData(drawuid, prizeBond),
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
                return ListTile(
                  title: Text('Draw Number: ${searchBond.drawNumber}'),
                  subtitle:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bond Number: ${searchBond.prizeBondNumber}'),
                      Text('Draw Date: ${searchBond.drawDate.toString()}'),
                      Text('Held At: ${searchBond.heldAt}'),
                      Text('Prize Bond Type: ${searchBond.prizeBondType}'),
                      Text('Prize Bond Amount: ${searchBond.prizeBondAmount}'),
                      //Text('Prize Type: ${searchBond.prizeType}'),
                      Text('Prize: ${searchBond.prize}'),
                      Text('Prize Amount: ${searchBond.prizeAmount}'),
                    ],
                  )
                  // Add more fields as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
