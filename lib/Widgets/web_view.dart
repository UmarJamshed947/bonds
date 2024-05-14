
import 'package:bonds/Views/Dashboard.dart';
import 'package:bonds/Widgets/date_dropdown.dart';
import 'package:bonds/Widgets/draw_dropdown.dart';
import 'package:bonds/Widgets/text_field.dart';
import 'package:flutter/material.dart';
import '../Controller/ApiService.dart';
import '../Models/Draw_Date.dart';
import '../Views/rangesearch_results.dart';
import '../Views/singlesearch_result.dart';
import '../Widgets/customtext.dart';


class Draw extends StatefulWidget {
  @override
  State<Draw> createState() => _DrawState();
}

class _DrawState extends State<Draw> with TickerProviderStateMixin {
  ApiService apiService = ApiService();
  String? drawDateUid;
  String? bondTypeUid;
  List<DrawDate> drawDates = [];
  Future<void> fetchData() async {
    if (bondTypeUid != null) {
      List<DrawDate> newDrawDates =
      await apiService.fetchDrawDateData(bondTypeUid!);
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
      //backgroundColor: Color(0xFFDCDCDC),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Color(0xFF2196F3),
        title: CustomText(txt: 'Draw Search', fntSize: 22),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
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
                    ),

                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 10),
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
                    ),
                  ],
                )

            ),
            SizedBox(height: 15),
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
                            scale: selectedRadio == 0
                                ? 1 + _animation.value * 0.1
                                : 1,
                            child: child,
                          );
                        },
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Color(0xFF2196F3), // Change non-active color here
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
                            activeColor: Color(0xFF2196F3),
                            hoverColor: Color(0xFF2196F3),
                            focusColor: Color(0xFF2196F3),
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      CustomText(
                          txt: 'From/To', fntSize: 20, clr: Color(0xFF2196F3)),
                      AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: selectedRadio == 1
                                ? 1 + _animation.value * 0.1
                                : 1,
                            child: child,
                          );
                        },
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Color(0xFF2196F3),
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
                            activeColor: Color(0xFF2196F3),
                            hoverColor: Color(0xFF2196F3),
                            focusColor: Color(0xFF2196F3),
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                      CustomText(
                          txt: 'Misc.Numbers',
                          fntSize: 20,
                          clr: Color(0xFF2196F3)),
                    ],
                  ),
                  SizedBox(height: 10),
                  if (selectedRadio == 0)
                    Column(
                      children: [
                        CustomText(
                            txt: 'Range Search',
                            fntSize: 26,
                            clr: Color(0xFF2196F3)),
                        SizedBox(height: 10),
                        CustomText(
                            txt:
                            'Search for all numbers in range',
                            clr: Color(0xFF2196F3),
                            fntSize: 16,
                            fntWeight: FontWeight.normal),
                        CustomText(
                            txt:
                            'Example: From: 122000 To: 122099',
                            clr: Color(0xFF2196F3),
                            fntSize: 14,
                            fontStyle: FontStyle.italic,
                          fntWeight: FontWeight.normal,
                        ),

                        SizedBox(height: 10),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CustomText(
                                    txt: 'From:',
                                    clr: Color(0xFF2196F3),
                                    fntSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomTextField(
                                  controller: _fromRangeController,
                                  requiredMessage: '* this field is required',),
                              ),

                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: CustomText(
                                    txt: 'To:',
                                    clr: Color(0xFF2196F3),
                                    fntSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CustomTextField(
                                  controller: _toRangeController,
                                  requiredMessage: '* this field is required',),
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
                            child: CustomText(
                                txt: 'Miscel.Numbers',
                                clr: Color(0xFF2196F3),
                                fntSize: 20),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomTextField(
                              controller: _randomRangeController,
                              requiredMessage: '* the field is required',),
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
                    if (bondTypeUid == null || drawDateUid == null || _fromRangeController.text.trim().isEmpty || _toRangeController.text.trim().isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Warning',style: TextStyle(color: Colors.red)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (bondTypeUid == null) Text('Please select a draw from the dropdown.'),
                              if (drawDateUid == null) Text('Please select a date from the dropdown.'),
                              if (_fromRangeController.text.trim().isEmpty) Text('The From range is empty'),
                              if (_toRangeController.text.trim().isEmpty) Text('The To range is empty'),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK', style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RangeSearchResult(
                            drawUid: drawDateUid!,
                            firstNumber: int.parse(_fromRangeController.text.trim()),
                            lastNumber: int.parse(_toRangeController.text.trim()),
                            prizeBondTypeUid: bondTypeUid.toString(),
                          ),
                        ),
                      );
                    }
                  } else if (selectedRadio == 1) {
                    if (bondTypeUid == null || drawDateUid == null || _randomRangeController.text.trim().isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:  Text('Warning',style: TextStyle(color: Colors.red)),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (bondTypeUid == null) Text("Please select a draw from the dropdown."),
                              if (drawDateUid == null) Text("Please select a date from the dropdown."),
                              if (_randomRangeController.text.trim().isEmpty) Text("The prize bond field is empty."),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('OK', style: TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      );
                    } else {
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
                  }
                },

                child: CustomText(txt: 'Search', fntSize: 20),
              color: Color(0xFF2196F3),
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
