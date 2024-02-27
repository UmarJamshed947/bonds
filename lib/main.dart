import 'package:flutter/material.dart';

import 'Dashboard/Dashboard.dart';

void main() => runApp(const Prizebonds());

class Prizebonds extends StatelessWidget {
  const Prizebonds({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Dashboard(),
    );
  }
}
