import 'package:flutter/material.dart';
import 'package:bonds/Widgets/date_dropdown.dart';
import 'package:bonds/Widgets/draw_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade600,
        title: Text(
          'Schedule',
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
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 20,left: 8,right: 8),
            child: Text(
              "PRIZE BOND DRAW SCHEDULE 2022",
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Image.asset(
              'assets/images/schedule.png',
              fit: BoxFit.fill,
              // width: double.infinity, // Adjust width as needed
              // height: double.infinity, // Adjust height as needed
            ),
          ),
        ],
      ),
    );
  }
}
