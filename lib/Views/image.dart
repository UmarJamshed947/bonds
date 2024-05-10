import 'package:bonds/Views/sec_feature_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Assuming this is your import for DisplaySecurityFeatures

class SecurityFeatures extends StatelessWidget {
  final List<PrizeBondInfo> prizeBondInfoList = [
    PrizeBondInfo(imagePath: 'assets/100.jpg', text: '100', prizeBondTypeUid: '01381510-f10e-4bf9-b41a-cefa39918a5e'),
    PrizeBondInfo(imagePath: 'assets/200.jpg', text: '200', prizeBondTypeUid: '0580e8db-5103-429d-93e0-08d41375ce3c'),
    PrizeBondInfo(imagePath: 'assets/750.jpg', text: '750', prizeBondTypeUid: 'd5ea03b7-0232-4e49-8cd3-9fac50d28bce'),
    PrizeBondInfo(imagePath: 'assets/1500.jpg', text: '1500', prizeBondTypeUid: '1a50291b-cb32-4382-b4d4-0973000579d1'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        backgroundColor: Color(0xFF2196F3),

        elevation: 3,

        title: Text(
          'Security Features',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 60, 10, 30),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: prizeBondInfoList.length,
          itemBuilder: (context, index) {
            return buildImageContainer(context, prizeBondInfoList[index]);
          },
        ),
      ),
    );
  }

  Widget buildImageContainer(BuildContext context, PrizeBondInfo prizeBondInfo) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DisplaySecurityFeatures(prizeBondTypeUid: prizeBondInfo.prizeBondTypeUid),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.teal,
          image: DecorationImage(
            image: AssetImage(prizeBondInfo.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            prizeBondInfo.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class PrizeBondInfo {
  final String imagePath;
  final String text;
  final String prizeBondTypeUid;

  PrizeBondInfo({
    required this.imagePath,
    required this.text,
    required this.prizeBondTypeUid,
  });
}
