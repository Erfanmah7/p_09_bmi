import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';

class CircularButton extends StatelessWidget {

 final IconData iconData;
 VoidCallback onpressd;
 CircularButton({required this.onpressd,required this.iconData});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressd,
      shape: CircleBorder(),
      color: kbluelightColor,
      height: 60,
      minWidth: 60,
      child: Icon(iconData),
    );
  }
}
