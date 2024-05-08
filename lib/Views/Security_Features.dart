import 'package:bonds/Views/sec_feature_display.dart';
import 'package:bonds/Widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Map<String, String> prizeBondTypeUidMap = {
//   '100': '01381510-f10e-4bf9-b41a-cefa39918a5e',
//   '200': '0580e8db-5103-429d-93e0-08d41375ce3c',
//   '750': 'd5ea03b7-0232-4e49-8cd3-9fac50d28bce',
//   '1500': '1a50291b-cb32-4382-b4d4-0973000579d1',
// };

class SecurityFeatures extends StatefulWidget {
  @override
  State<SecurityFeatures> createState() => _SecurityFeaturesState();
}

class _SecurityFeaturesState extends State<SecurityFeatures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade600,
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
        child: Column(
          children: [
            Container(
              width: 400,
              height: 100,
              child: CardWidget(
                txt: '100',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
                onTap: () {
                  // String? prizeBondTypeUid =
                  //     prizeBondTypeUidMap['100']; // Nullable string
                  // if (prizeBondTypeUid != null) {
                  //   // Check if the value is not null
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => DisplaySecurityFeatures(
                  //           prizeBondTypeUid: prizeBondTypeUid),
                  //     ),
                  //   );
                  // }

                  Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => DisplaySecurityFeatures(prizeBondTypeUid: '01381510-f10e-4bf9-b41a-cefa39918a5e'),
                  ));
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 100,
              child: CardWidget(
                txt: '200',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplaySecurityFeatures(prizeBondTypeUid: '0580e8db-5103-429d-93e0-08d41375ce3c'),
                      ));
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 100,
              child: CardWidget(
                txt: '750',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplaySecurityFeatures(prizeBondTypeUid: 'd5ea03b7-0232-4e49-8cd3-9fac50d28bce'),
                      ));
                },
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 100,
              child: CardWidget(
                txt: '1500',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisplaySecurityFeatures(prizeBondTypeUid: '1a50291b-cb32-4382-b4d4-0973000579d1'),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

class LargeImageView extends StatelessWidget {
  final String imagePath;

  LargeImageView({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
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
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}*/
// '100': '01381510-f10e-4bf9-b41a-cefa39918a5e',
// '200': '0580e8db-5103-429d-93e0-08d41375ce3c',
// '750': 'd5ea03b7-0232-4e49-8cd3-9fac50d28bce',
// '1500': '1a50291b-cb32-4382-b4d4-0973000579d1',
