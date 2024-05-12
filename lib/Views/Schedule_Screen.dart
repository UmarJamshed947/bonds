import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:bonds/Widgets/date_dropdown.dart';
import 'package:bonds/Widgets/draw_dropdown.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Widgets/customtext.dart';

class ScheduleScreen extends StatefulWidget {
  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF8F8),
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Color(0xFF2196F3),
        title: CustomText(txt: 'Draw Search', fntSize: 22),
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "PRIZE BOND DRAW SCHEDULE 2022",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 15,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoView(
                      imageProvider: AssetImage('assets/images/schedule.png'),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered,
                    ),
                  ),
                );
              },
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: PhotoView(
                  backgroundDecoration: BoxDecoration(
                    color: Colors.teal, // Set the background color to red
                  ),
                imageProvider: AssetImage('assets/images/schedule.png'),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered,
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
