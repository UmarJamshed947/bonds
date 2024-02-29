import 'package:flutter/material.dart';

import 'Dashboard/Dashboard.dart';

void main() => runApp( Prizebonds());

class Prizebonds extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}
