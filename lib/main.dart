import 'package:flutter/material.dart';

import 'Views/Dashboard.dart';

void main() => runApp( Prizebonds());

class Prizebonds extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}
