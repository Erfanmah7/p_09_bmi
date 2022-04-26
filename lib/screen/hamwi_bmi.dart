import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';
import 'package:p_09_bmi/widget/base_plane.dart';

class Hamwi extends StatelessWidget {
  Size size;
  String hawmi;
  String Space;
  String advice;

  Hamwi({required this.size, required this.hawmi, required this.Space,required this.advice});

  @override
  Widget build(BuildContext context) {
    return BasePlane(
      size: size,
      button: 'BACK',
      widgetBase: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        height: size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Ideal Weight :', style: kStylegrey),
            Text(
              hawmi.substring(0, hawmi.indexOf('.') + 2),
              style: kStylewhite.copyWith(fontSize: 100),
            ),
            Text('Your distance to your ideal weight : $Space',
                style: kStylegrey.copyWith(
                    fontSize: 13, fontWeight: FontWeight.normal)),
            SizedBox(
              height: 20,
            ),
            Text(
              advice,
              textAlign: TextAlign.center,
              style: kStylewhite.copyWith(
                  fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      navigat: () {
        Navigator.pop(context);
      },
    );
  }


}
