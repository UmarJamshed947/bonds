import 'package:flutter/material.dart';

import '../Widgets/customtext.dart';

class TableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFCBF3F0),
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Color(0xFF2EC4B6),
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
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(10),
                child: CustomText(
                  txt: 'GOVERNMENT OF PAKISTAN\n'
                      'CENTRAL DIRECTORATE OF NATIONAL SAVINGS ISLAMABAD\n'
                      'No.F.3 (12) Sch-2/PB-15/Draw Schedule.\n'
                      '24th October, 2023\n'
                      'DRAW SCHEDULE OF NATIONAL PRIZE BONDS FROM JANUARY, 2024 TO DECEMBER, 2024,',
                  textAlign: TextAlign.center,
                  fntSize: 16,
                  clr: Color(0xFF333333),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(15),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey),
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('Day/Date'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rs.1500/-'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rs.100/-'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-02-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Lahore'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Peshawar'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-05-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Karachi'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Lahore'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-08-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Multan'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Karachi'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-11-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rawalpindi'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Multan'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(15),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey),
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('Day'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rs.750/-'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rs.200/-'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-01-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Sialkot'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-03-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Muzaffarabad'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-04-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Hyderabad'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('17-06-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rawalpindi'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-07-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Quetta'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('16-09-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Peshawar'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('15-10-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Faisalabad'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('16-12-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text(''),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Sialkot'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding:  EdgeInsets.all(10),
                child: CustomText(
                  txt:'DRAW SCHEDULE OF PREMIUM PRIZE BONDS RS.40.000/- & Rs.25.000/- FROM JANUARY, 2024 TO DECEMBER, 2024.',
                  textAlign: TextAlign.center,
                  fntSize: 16,
                  clr: Color(0xFF333333),


                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(15),
                child: Table(
                  border: TableBorder.all(),
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey),
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('Day'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rs.40,000/-'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Rs.25,000/-'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('11-03-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Faisalabad'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Karachi'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('10-06-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Multan'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Peshawar'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('10-09-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Lahore'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Hyderabad'),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        TableCell(
                          child: Center(
                            child: Text('10-12-2024'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Muzaffarabad'),
                          ),
                        ),
                        TableCell(
                          child: Center(
                            child: Text('Quetta'),
                          ),
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
    );
  }
}
