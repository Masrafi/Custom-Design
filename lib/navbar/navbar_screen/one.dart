import 'package:flutter/material.dart';

class One extends StatelessWidget {
  const One({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "One",
        style: TextStyle(fontSize: 50, color: Colors.red),
      )),
    );
  }
}
