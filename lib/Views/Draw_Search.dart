import 'package:bonds/Widgets/date_dropdown.dart';
import 'package:bonds/Widgets/draw_dropdown.dart';
import 'package:bonds/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import '../Controller/ApiService.dart';
import '../Models/Draw_Date.dart';
import '../Widgets/customtext.dart';
import 'Rangesearch_Results.dart';
import 'Search_Result.dart';

class Drawsearch extends StatefulWidget {
  @override
  State<Drawsearch> createState() => _DrawsearchState();
}

class _DrawsearchState extends State<Drawsearch> {
  ApiService apiService = ApiService();
  String? drawDateUid;
  String? bondTypeUid;

  List<DrawDate> drawDates = [];

  Future<void> fetchData() async {
    //print("Fetching dates for draw UID: ${widget.drawUid}");
    if (bondTypeUid != null) {
      List<DrawDate> newDrawDates = await apiService.fetchDrawDateData(bondTypeUid!);
      setState(() {
        drawDates = newDrawDates;
      });
    }
  }

  TextEditingController _fromRangeController = TextEditingController();
  TextEditingController _toRangeController = TextEditingController();
  TextEditingController _randomRangeController = TextEditingController();

  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal.shade600,
        title: CustomText(txt: 'Draw Search', fntSize: 18),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 350,
                    child: DrawDropdown(
                      onDrawSelected: (drawUid) {
                        setState(() {
                          bondTypeUid = drawUid;
                          drawDates = [];
                          print("selected bondtype");
                          print(bondTypeUid);
                        });
                        fetchData();
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 60,
                    width: 350,
                    child: DateDropdown(
                      drawUid: drawDateUid,
                      drawDates: drawDates,
                      onDateSelected: (date) {
                        setState(() {
                          drawDateUid = date;
                          print("selectedValue date dropdown");
                          print(drawDateUid);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              Colors.white, // Change non-active color here
                        ),
                        child: Radio(
                          value: 0,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value as int;
                            });
                          },
                          activeColor: Colors.white,
                          hoverColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      CustomText(txt: 'From/To'),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: Colors.white,
                        ), // Change non-active color here

                        child: Radio(
                          value: 1,
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value as int;
                            });
                          },
                          activeColor: Colors.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                      CustomText(txt: 'Misc.Numbers'),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (selectedRadio == 0)
                    Column(
                      children: [
                        CustomText(txt: 'Range Search', fntSize: 16),
                        SizedBox(height: 10),
                        CustomText(
                            txt:
                                'Search For All Numbers in Range EXAMPLE: From: 122000 To: 122099'),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CustomText(txt: 'From'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomTextField(
                                    controller: _fromRangeController),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CustomText(txt: 'To'),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomTextField(
                                    controller: _toRangeController),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (selectedRadio == 1)
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CustomText(txt: 'Miscel.Numbers'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomTextField(
                                controller: _randomRangeController),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              color: Colors.teal.shade900,
              onPressed: () async {
                print("custom check dduid: ${drawDateUid}");
                print("custom check btuid: ${bondTypeUid}");
                if (selectedRadio == 0) {
                  // Perform range search
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RangeSearchResult(
                        drawUid: drawDateUid!,
                        firstNumber:
                            int.parse(_fromRangeController.text.trim()),
                        lastNumber: int.parse(_toRangeController.text.trim()),
                        prizeBondTypeUid: bondTypeUid.toString(),
                      ),
                    ),
                  );
                } else if (selectedRadio == 1) {
                  // Perform miscellaneous numbers search
                  String prizeBondTypeUid = bondTypeUid.toString();
                  String prizeBond = _randomRangeController.text.trim();
                  if (prizeBond.isNotEmpty) {
                    // Call the searchdata function
                    //List<SearchBond> searchResults = await searchdata(prizeBondTypeUid, drawDateUid!, prizeBond);
                    // Handle the search results

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResult(
                          prizeBondTypeUid: prizeBondTypeUid,
                          drawDateUid: drawDateUid!,
                          prizeBond: prizeBond,
                        ),
                      ),
                    );
                  }
                }
              },
              child: CustomText(txt: 'Search'),
            )
          ],
        ),
      ),
    );
  }
}
