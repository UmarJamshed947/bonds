// import 'package:flutter/material.dart';
// import 'package:bonds/Models/Sec_Features.dart'; // Import your SecFeatures model
// import 'package:bonds/controller/ApiService.dart'; // Import your ApiService
//
// class DisplaySecurityFeatures extends StatefulWidget {
//   final String prizeBondTypeUid;
//
//   DisplaySecurityFeatures({required this.prizeBondTypeUid});
//
//   @override
//   _DisplaySecurityFeaturesState createState() => _DisplaySecurityFeaturesState();
// }
//
// class _DisplaySecurityFeaturesState extends State<DisplaySecurityFeatures> {
//
//   final ApiService apiService = ApiService();
//   late Future<List<SecFeatures>> futureSecurityFeatures;
//
//   @override
//   void initState() {
//     super.initState();
//     futureSecurityFeatures = fetchSecurityFeatures();
//   }
//
//   Future<List<SecFeatures>> fetchSecurityFeatures() async {
//     try {
//       return await apiService.fetchSecurityFeatures(widget.prizeBondTypeUid);
//     } catch (e) {
//       // Handle error
//       print(e.toString());
//       return [];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Security Features'),
//       ),
//       body: Center(
//         child: FutureBuilder<List<SecFeatures>>(
//           future: futureSecurityFeatures,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               List<SecFeatures>? securityFeatures = snapshot.data;
//               if (securityFeatures != null && securityFeatures.isNotEmpty) {
//                 return ListView.builder(
//                   itemCount: securityFeatures.length,
//                   itemBuilder: (context, index) {
//                     final feature = securityFeatures[index];
//                     return ListTile(
//                       title: Text(feature.feature),
//                       subtitle: Text(feature.description ?? ''),
//                       leading: Image.network(feature.image), // Assuming image is a URL
//                     );
//                   },
//                 );
//               } else {
//                 return Text('No security features found.');
//               }
//             }
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bonds/Models/Sec_Features.dart';
import 'package:bonds/controller/ApiService.dart';
import '../Widgets/customtext.dart';

class DisplaySecurityFeatures extends StatelessWidget {
  final String prizeBondTypeUid;

  DisplaySecurityFeatures({required this.prizeBondTypeUid});

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xFF2EC4B6),
        title: CustomText(txt: 'Security Features ', fntSize: 22),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Color(0xFFCBF3F0),
        child: FutureBuilder<List<SecFeatures>>(
          future: apiService.fetchSecurityFeatures(prizeBondTypeUid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<SecFeatures>? securityFeatures = snapshot.data;
              if (securityFeatures != null && securityFeatures.isNotEmpty) {
                return ListView.builder(
                  itemCount: securityFeatures.length,
                  itemBuilder: (context, index) {
                    final feature = securityFeatures[index];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          feature.image,
                          fit: BoxFit.fitHeight,
                          // Adjust the height and width of the image if necessary
                          height: 200, // Adjust height as needed
                          width: double.infinity, // Take full width
                        ),
                        SizedBox(height: 5),
                        Text(feature.feature),
                        SizedBox(height: 5),
                        Text(feature.description ?? ''),

                      ],
                    );
                  },
                );
              } else {
                return Center(
                  child: Text('No security features found.'),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
