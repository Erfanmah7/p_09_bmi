import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';

class BoxContianer extends StatelessWidget {

  final Widget widgets;
  BoxContianer({required this.widgets});

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: 130,
        height: size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kblueblButtonColor,
        ),
        child: widgets,
      ),
    );
  }
}
