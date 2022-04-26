import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';
import 'package:p_09_bmi/widget/circular_button.dart';
import 'package:p_09_bmi/widget/box_contianer.dart';

class WeightAge extends StatelessWidget {
  final String text;
  final String number;
  VoidCallback inCrease;
  VoidCallback deCrease;

  WeightAge(
      {required this.text,
      required this.number,
      required this.deCrease,
      required this.inCrease});

  @override
  Widget build(BuildContext context) {
    return BoxContianer(
      widgets: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: kStylegrey,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            number,
            style: kStylewhite,
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularButton(iconData: Icons.remove, onpressd: deCrease),
              const SizedBox(
                width: 20,
              ),
              CircularButton(iconData: Icons.add, onpressd: inCrease),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
