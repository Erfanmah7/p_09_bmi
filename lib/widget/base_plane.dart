import 'package:flutter/material.dart';
import 'next_button.dart';

class BasePlane extends StatelessWidget {
  final Size size;
  final String button;
  final Widget widgetBase;
  final VoidCallback navigat;

  BasePlane(
      {required this.size,
      required this.button,
      required this.widgetBase,
      required this.navigat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.segment),
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          widgetBase,
          NextButton(
            text: button,
            size: size,
            onPressd:navigat,
          ),
        ],
      ),
    );
  }
}
