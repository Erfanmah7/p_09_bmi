import 'package:flutter/material.dart';
import 'package:p_09_bmi/screen/hamwi_bmi.dart';
import 'package:p_09_bmi/style.dart';
import 'package:p_09_bmi/widget/alert.dart';
import 'package:p_09_bmi/widget/base_plane.dart';
import 'package:p_09_bmi/widget/box_contianer.dart';
import 'package:p_09_bmi/widget/save_button.dart';

class Resalut extends StatelessWidget {
  final Size size;
  double weight = 74;
  double age = 19;
  String Space;
  String tip;
  String bmi;
  String satuse;
  Color statusColor;
  double hawmi;
  String advice;
  Function(BuildContext context) reset;

  Resalut(
      {required this.size,
      required this.tip,
      required this.bmi,
      required this.satuse,
      required this.statusColor,
      required this.reset,
      required this.hawmi,
      required this.Space,
      required this.advice});

  @override
  Widget build(BuildContext context) {
    return BasePlane(
      size: size,
      button: 'RE-CALCULATE YOUR BMI',
      widgetBase: Column(
        children: [
          Container(
              //margin: EdgeInsets.symmetric(horizontal: 10),
              // padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Your Result',
                style: kStylewhite.copyWith(fontSize: 35),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Hamwi(
                            size: size,
                            hawmi: hawmi.toString(),
                            Space: Space.substring(0, Space.indexOf('.') + 2),
                            advice: advice);
                      },
                    ),
                  );
                },
                icon: Icon(Icons.more_vert_rounded),
                tooltip: 'More',
              ),
            ],
          )),
          Container(
            height: size.height * 0.7,
            width: size.width * 0.9,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: BoxContianer(
              widgets: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Text(
                          satuse,
                          style: kStylegrey.copyWith(color: statusColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          bmi.substring(0, bmi.indexOf('.') + 2),
                          style: kStylewhite.copyWith(fontSize: 100),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Column(
                          children: [
                            Text(
                              'Normal BMI range:',
                              style: kStylegrey.copyWith(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.withAlpha(190),
                              ),
                            ),
                            const Text(
                              '18,5 - 25 kg/m2',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        Text(
                          tip,
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                        SaveButton(onPressd: () {
                          onPredd();
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      navigat: () {
        OnFinished(context);
      },
    );
  }

  void back(context) {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  void OnFinished(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Alert(size, () {
            reset(context);
          }, () {
            back(context);
          });
        });
  }


  onPredd() {
    //TODO
  }
}
