import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';

class NextButton extends StatelessWidget {
  final String text;
  final Size size;
  VoidCallback onPressd;

  NextButton({required this.text, required this.size,required this.onPressd});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressd,
      color: kpinkColor,
      minWidth: size.width,
      height: size.height * 0.08,
      child: Text(text,
          style: kStylewhite.copyWith(
              fontSize: 20, fontWeight: FontWeight.normal)),
    );
  }
}
