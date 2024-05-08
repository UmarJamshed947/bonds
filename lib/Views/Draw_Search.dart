// /*
// import 'package:bonds/Widgets/date_dropdown.dart';
// import 'package:bonds/Widgets/draw_dropdown.dart';
// import 'package:bonds/Widgets/text_field.dart';
// import 'package:flutter/material.dart';
// import '../Controller/ApiService.dart';
// import '../Models/Draw_Date.dart';
// import '../Widgets/customtext.dart';
// import 'Rangesearch_Results.dart';
// import 'Search_Result.dart';
//
// class Drawsearch extends StatefulWidget {
//   @override
//   State<Drawsearch> createState() => _DrawsearchState();
// }
//
// class _DrawsearchState extends State<Drawsearch> {
//   ApiService apiService = ApiService();
//   String? drawDateUid;
//   String? bondTypeUid;
//
//   List<DrawDate> drawDates = [];
//
//   Future<void> fetchData() async {
//     //print("Fetching dates for draw UID: ${widget.drawUid}");
//     if (bondTypeUid != null) {
//       List<DrawDate> newDrawDates = await apiService.fetchDrawDateData(bondTypeUid!);
//       setState(() {
//         drawDates = newDrawDates;
//       });
//     }
//   }
//
//   TextEditingController _fromRangeController = TextEditingController();
//   TextEditingController _toRangeController = TextEditingController();
//   TextEditingController _randomRangeController = TextEditingController();
//
//   int selectedRadio = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF9D4EDD),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Color(0xFF5A189A),
//         title: CustomText(txt: 'Draw Search', fntSize: 18),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios_outlined,
//             color: Colors.white,
//           ),
//           color: Colors.black,
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Container(
//                     height: 60,
//                     width: 350,
//                     child: DrawDropdown(
//                       onDrawSelected: (drawUid) {
//                         setState(() {
//                           bondTypeUid = drawUid;
//                           drawDates = [];
//                           print("selected bondtype");
//                           print(bondTypeUid);
//                         });
//                         fetchData();
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     height: 60,
//                     width: 350,
//                     child: DateDropdown(
//                       drawUid: drawDateUid,
//                       drawDates: drawDates,
//                       onDateSelected: (date) {
//                         setState(() {
//                           drawDateUid = date;
//                           print("selectedValue date dropdown");
//                           print(drawDateUid);
//                         });
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 5),
//             Container(
//               padding: EdgeInsets.all(10),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Theme(
//                         data: Theme.of(context).copyWith(
//                           unselectedWidgetColor:
//                               Colors.white, // Change non-active color here
//                         ),
//                         child: Radio(
//                           value: 0,
//                           groupValue: selectedRadio,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedRadio = value as int;
//                             });
//                           },
//                           activeColor: Colors.white,
//                           hoverColor: Colors.white,
//                           materialTapTargetSize:
//                               MaterialTapTargetSize.shrinkWrap,
//                         ),
//                       ),
//                       CustomText(txt: 'From/To',fntSize: 16),
//                       Theme(
//                         data: Theme.of(context).copyWith(
//                           unselectedWidgetColor: Colors.white,
//                         ), // Change non-active color here
//
//                         child: Radio(
//                           value: 1,
//                           groupValue: selectedRadio,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedRadio = value as int;
//                             });
//                           },
//                           activeColor: Colors.white,
//                           materialTapTargetSize:
//                               MaterialTapTargetSize.shrinkWrap,
//                         ),
//                       ),
//                       CustomText(txt: 'Misc.Numbers',fntSize: 16),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   if (selectedRadio == 0)
//                     Column(
//                       children: [
//                         CustomText(txt: 'Range Search', fntSize: 20),
//                         SizedBox(height: 10),
//                         CustomText(
//                             txt:
//                                 'Search For All Numbers in Range EXAMPLE: From: 122000 To: 122099'),
//                         SizedBox(height: 20),
//                         Container(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: CustomText(txt: 'From'),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: CustomTextField(
//                                     controller: _fromRangeController),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(4.0),
//                                 child: CustomText(txt: 'To'),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.all(8.0),
//                                 child: CustomTextField(
//                                     controller: _toRangeController),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   if (selectedRadio == 1)
//                     Container(
//                       padding: EdgeInsets.all(10),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.all(4.0),
//                             child: CustomText(txt: 'Miscel.Numbers'),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(8.0),
//                             child: CustomTextField(
//                                 controller: _randomRangeController),
//                           ),
//                         ],
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             MaterialButton(
//
//               onPressed: () async {
//                 print("custom check dduid: ${drawDateUid}");
//                 print("custom check btuid: ${bondTypeUid}");
//                 if (selectedRadio == 0) {
//                   // Perform range search
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RangeSearchResult(
//                         drawUid: drawDateUid!,
//                         firstNumber:
//                             int.parse(_fromRangeController.text.trim()),
//                         lastNumber: int.parse(_toRangeController.text.trim()),
//                         prizeBondTypeUid: bondTypeUid.toString(),
//                       ),
//                     ),
//                   );
//                 } else if (selectedRadio == 1) {
//                   // Perform miscellaneous numbers search
//                   String prizeBondTypeUid = bondTypeUid.toString();
//                   String prizeBond = _randomRangeController.text.trim();
//                   if (prizeBond.isNotEmpty) {
//                     // Call the searchdata function
//                     //List<SearchBond> searchResults = await searchdata(prizeBondTypeUid, drawDateUid!, prizeBond);
//                     // Handle the search results
//
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => SearchResult(
//                           prizeBondTypeUid: prizeBondTypeUid,
//                           drawDateUid: drawDateUid!,
//                           prizeBond: prizeBond,
//                         ),
//                       ),
//                     );
//                   }
//                 }
//               },
//               child: CustomText(txt: 'Search'),
//               color: Color(0xFF5A189A),
//               minWidth: 300,
//               height: 50,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// */
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

class _DrawsearchState extends State<Drawsearch> with TickerProviderStateMixin {
  ApiService apiService = ApiService();
  String? drawDateUid;
  String? bondTypeUid;
  List<DrawDate> drawDates = [];
  Future<void> fetchData() async {
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
  late AnimationController _animationController;
  late Animation<double> _animation;
  final Duration _animationDuration = Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCBF3F0),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xFF2EC4B6),
        title: CustomText(txt: 'Draw Search', fntSize: 22),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 40),
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
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: selectedRadio == 0 ? 1 + _animation.value * 0.1 : 1,
                            child: child,
                          );
                        },
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor:  Color(0xFF333333), // Change non-active color here
                          ),
                          child: Radio(
                            value: 0,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value as int;
                              });
                              _animationController.forward(from: 0);
                            },
                            activeColor:  Color(0xFF333333),
                            hoverColor:  Color(0xFF333333),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      CustomText(txt: 'From/To',fntSize: 20,clr: Color(0xFF333333)),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: selectedRadio == 1 ? 1 + _animation.value * 0.1 : 1,
                            child: child,
                          );
                        },
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor:  Color(0xFF333333),
                          ),
                          child: Radio(
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (value) {
                              setState(() {
                                selectedRadio = value as int;
                              });
                              _animationController.forward(from: 0);
                            },
                            activeColor: Color(0xFF333333),
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      CustomText(txt: 'Misc.Numbers',fntSize: 20,clr: Color(0xFF333333)),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (selectedRadio == 0)
                    Column(
                      children: [
                        CustomText(txt: 'Range Search', fntSize: 26,clr: Color(0xFF333333)),
                        SizedBox(height: 10),
                        CustomText(
                            txt:
                            'Search For All Numbers in Range EXAMPLE: From: 122000 To: 122099',clr: Color(0xFF333333),fntSize: 16),
                        SizedBox(height: 20),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CustomText(txt: 'From',clr: Color(0xFF333333),fntSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomTextField(
                                    controller: _fromRangeController),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CustomText(txt: 'To',clr: Color(0xFF333333),fntSize: 20),
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
                      padding: EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: CustomText(txt: 'Miscel.Numbers',clr: Color(0xFF333333),fntSize: 20),
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
              onPressed: () async {
                if (selectedRadio == 0) {
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
                  String prizeBondTypeUid = bondTypeUid.toString();
                  String prizeBond = _randomRangeController.text.trim();
                  if (prizeBond.isNotEmpty) {
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
              child: CustomText(txt: 'Search',fntSize: 20),
              color:  Color(0xFF2EC4B6),
              minWidth: 300,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
