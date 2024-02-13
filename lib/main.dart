

import 'package:bonds/Dashboard.dart';
import 'package:bonds/screens/draw_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'homepage.dart';

void main() => runApp(Prizebonds());

class Prizebonds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Dashboard(),
    );
  }
}
