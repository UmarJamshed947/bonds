import 'package:flutter/material.dart';

import '../Widgets/custom_table.dart';
import '../Widgets/customtext.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
       // backgroundColor: Color(0xFFFAF8F8),
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Color(0xFF2196F3),
          title: CustomText(txt: "Schedule", fntSize: 22),
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomText(txt: 'GOVERNMENT OF PAKISTAN',fntSize: 20,clr:Color(0xFF2196F3)),
                CustomText(txt: 'CENTRAL DIRECTORATE OF NATIONAL SAVINGS ISLAMABAD',textAlign: TextAlign.center,fntSize: 14,clr: Colors.grey[600],fntWeight: FontWeight.normal,),
               // CustomText(txt:  'No.F.3 (12) Sch-2/PB-15/Draw Schedule',fntSize: 14,clr: Colors.grey[600],fntWeight: FontWeight.normal),
                //CustomText(txt:  '24th October, 2023',fntSize: 14,clr: Colors.grey[600],fntWeight: FontWeight.normal),
                CustomText(txt:  'DRAW SCHEDULE OF NATIONAL PRIZE BONDS FROM JANUARY, 2024 TO DECEMBER, 2024,',textAlign: TextAlign.center,fntSize: 14,clr: Colors.grey[600],fntWeight: FontWeight.normal),




                Padding(
                  padding: EdgeInsets.all(15),
                  child: Table(
                    border: TableBorder.all(color:Color(0xFF2196F3),width: 1.0),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFF2196F3)),
                        children: [
                          CustomTableCell(txt:('Date'),fntWeight: FontWeight.bold,clr: Colors.white,
                          ),
                          CustomTableCell(txt:('Rs.1500/-'),fntWeight: FontWeight.bold,clr: Colors.white,
                          ),
                          CustomTableCell(txt:('Rs.100/-'),fntWeight: FontWeight.bold,clr: Colors.white,
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('15-02-2024'),
                          ),
                          CustomTableCell(txt:('Lahore'),

                          ),
                          CustomTableCell(txt:('Peshawar'),

                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('15-05-2024'),

                          ),
                          CustomTableCell(txt:('Karachi'),


                          ),
                          CustomTableCell(txt:('Lahore'),

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('15-08-2024'),

                          ),
                          CustomTableCell(txt:('Multan'), ),
                            CustomTableCell(txt:('Karachi'),


                          ),


                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('15-11-2024'),

                          ),
                          CustomTableCell(txt:('Rawalpindi'),


                          ),
                          CustomTableCell(txt:('Multan'),


                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: Table(
                    border: TableBorder.all(color: Color(0xFF2196F3),width: 1.0),
                    children: [

                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFF2196F3)),
                        children: [
                          CustomTableCell(txt:('Day'),fntWeight: FontWeight.bold,clr: Colors.white,

                          ),
                          CustomTableCell(txt:('Rs.750/-'),fntWeight: FontWeight.bold,clr: Colors.white,



                          ),
                          CustomTableCell(txt:('Rs.200/-'),fntWeight: FontWeight.bold,clr: Colors.white,

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('15-01-2024'),

                          ),
                          CustomTableCell(txt:('Sialkot'),),
                            CustomTableCell(txt:(''),



                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('15-03-2024'),

                          ),
                          CustomTableCell(txt:(''),

                          ),
                          CustomTableCell(txt:('Muzaffarabad'),

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('15-04-2024'),

                          ),
                          CustomTableCell(txt:('Hyderabad'),

                          ),
                          CustomTableCell(txt:(''),

                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('17-06-2024'),

                          ),
                          CustomTableCell(txt:(''),


                          ),
                          CustomTableCell(txt:('Rawalpindi'),

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('15-07-2024'),

                          ),
                          CustomTableCell(txt:('Quetta'),

                          ),
                          CustomTableCell(txt:(''),

                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('16-09-2024'),

                          ),
                          CustomTableCell(txt:(''),

                          ),
                          CustomTableCell(txt:('Peshawar'),

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('15-10-2024'),

                          ),
                          CustomTableCell(txt:('Faisalabad'),

                          ),
                          CustomTableCell(txt:(''),

                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('16-12-2024'),

                          ),
                          CustomTableCell(txt:(''),

                          ),
                          CustomTableCell(txt:('Sialkot'),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.all(10),
                  child: CustomText(
                    txt:'DRAW SCHEDULE OF PREMIUM PRIZE BONDS RS.40.000/- & Rs.25.000/- FROM JANUARY, 2024 TO DECEMBER, 2024.',
                    textAlign: TextAlign.center,
                    fntSize: 14,
                    fntWeight: FontWeight.normal,
                    clr: Colors.grey[600],


                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15),
                  child: Table(
                    border: TableBorder.all(color: Color(0xFF2196F3),width: 1.0),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFF2196F3)),
                        children: [
                          CustomTableCell(txt:('Day'),fntWeight: FontWeight.bold,clr: Colors.white,

                          ),
                          CustomTableCell(txt:('Rs.40,000/-'),fntWeight: FontWeight.bold,clr: Colors.white,

                          ),
                          CustomTableCell(txt:('Rs.25,000/-'),fntWeight: FontWeight.bold,clr: Colors.white,

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('11-03-2024'),

                          ),
                          CustomTableCell(txt:('Faisalabad'),

                          ),
                          CustomTableCell(txt:('Karachi'),

                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('10-06-2024'),

                          ),
                          CustomTableCell(txt:('Multan'),

                          ),
                          CustomTableCell(txt:('Peshawar'),

                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          CustomTableCell(txt:('10-09-2024'),

                          ),
                          CustomTableCell(txt:('Lahore'),

                          ),
                          CustomTableCell(txt:('Hyderabad'),

                          ),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(color: Color(0xFFBBDEFB)),
                        children: [
                          CustomTableCell(txt:('10-12-2024'),

                          ),
                          CustomTableCell(txt:('Muzaffarabad'),

                          ),
                          CustomTableCell(txt:('Quetta'),

                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
