import 'package:bonds/Widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              height: 80,
              child: CardWidget(
                txt: '100',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 80,
              child: CardWidget(
                txt: '200',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 80,
              child: CardWidget(
                txt: '750',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 400,
              height: 80,
              child: CardWidget(
                txt: '1500',
                icon: Icons.monetization_on_outlined,
                color: Colors.teal,
                displayInRow: true,
                trailingIcon: Icons.arrow_forward_ios_outlined,
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
