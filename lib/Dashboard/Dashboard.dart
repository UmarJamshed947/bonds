import 'package:bonds/Models/Draw_Date.dart';
import 'package:bonds/Views/Schedule_Screen.dart';
import 'package:bonds/Views/Security_Features.dart';
import 'package:bonds/controller/ApiService.dart';
import 'package:bonds/widgets/date_dropdown.dart';
import 'package:bonds/widgets/draw_dropdown.dart';
import 'package:bonds/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:bonds/widgets/card_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Views/Draw_Search.dart';
import '../Widgets/web_view.dart';

class Dashboard extends StatefulWidget {


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  WebViewController? _webViewController;

  ApiService apiService = ApiService();
  String? selectedDrawUid;
  String? selectedDate;
  List<DrawDate> drawDates = [];

  Future<void> fetchData() async {
    //print("Fetching dates for draw UID: ${widget.drawUid}");
    if (selectedDrawUid != null) {
      List<DrawDate> newDrawDates = await apiService.fetchDrawDateData(selectedDrawUid!);
      setState(() {
        drawDates = newDrawDates;
      });
    }
  }

  // Function to open a WebView for a given URL
  void openWebView(String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(initialUrl: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal.shade600,
          title:  SizedBox(
            height: 100,
            width: 100,
          ),
          centerTitle: true,
          leading: IconButton(
            icon:  Icon(
              Icons.menu,
              color: Colors.white,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          color: Colors.teal,
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: [Color(0xFFFAD585), Color(0xFFF47A7D)])),
          child: Column(
            children: [
              Container(
                padding:  EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DrawDropdown(
                      onDrawSelected: (drawUid) {
                        setState(() {
                          selectedDrawUid = drawUid;
                          selectedDate = null;
                          drawDates = [];
                        });
                        fetchData();
                      },
                    ),
                    DateDropdown(
                      drawUid: selectedDrawUid,
                      drawDates: drawDates,
                      onDateSelected: (date) {
                        setState(() {
                          selectedDate = date;
                          print("selectedValue");
                          print(selectedDate);
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SearchWidget(dateUid: selectedDate ?? '', prizeBondTypeUid: selectedDrawUid ?? ''),
              Flexible(
                child: Container(
                  //padding:  EdgeInsets.only(top: 5),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal.shade100,
                    borderRadius:  BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(25),
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 12,
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                      children:  [
                        CardWidget(
                          txt: "Draw-Search",
                          icon: Icons.search,
                          color: Colors.teal,
                          onTap: () {
                            print("Draw-Search card tapped");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Drawsearch()));
                          },
                          //color: Color(0xFF2ECC71), // Green
                        ),
                        CardWidget(
                          txt: "Downloads",
                          icon: Icons.file_download,
                          color: Colors.teal,
                          onTap: (){
                            print("Downloads card tapped");
                            openWebView('https://savings.gov.pk/prize-bonds/'); // Replace with your URL
                          },
                          // color: Color(0xFF3498DB), // Blue
                        ),
                        CardWidget(
                          txt: "Schedules",
                          icon: Icons.event,
                          color: Colors.teal,
                          onTap: () {
                            print("Draw-Search card tapped");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleScreen()));
                          },
                          // color: Color(0xFFE67E22), // Orange
                        ),
                        CardWidget(
                          txt: "Sec-Features",
                          icon: Icons.security,
                          color: Colors.teal,
                          onTap: () {
                            print("Draw-Search card tapped");
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SecurityFeatures()));
                          },
                          // color: Color(0xFF9B59B6), // Purple
                        ),
                        CardWidget(
                          txt: "Denominations",
                          icon: Icons.attach_money_outlined,
                          color: Colors.teal,
                          // color: Color(0xFF1ABC9C), // Turquoise
                        ),
                        CardWidget(
                          txt: "Prem-Bonds",
                          icon: Icons.star,
                          color: Colors.teal,
                          // color: Color(0xFFE74C3C), // Red
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
