

import 'package:bonds/Dashboard.dart';
import 'package:bonds/screens/draw_search.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

void main() => runApp(Prizebonds());

class Prizebonds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Drawsearch(),
    );
  }
}
