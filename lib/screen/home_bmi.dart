import 'dart:math';

import 'package:flutter/material.dart';
import 'package:p_09_bmi/screen/resalut.dart';
import 'package:p_09_bmi/style.dart';
import 'package:p_09_bmi/widget/base_plane.dart';
import 'package:p_09_bmi/widget/box_contianer.dart';
import 'package:p_09_bmi/widget/gender.dart';
import 'package:p_09_bmi/widget/weight_age.dart';

class homeBmi extends StatefulWidget {
  @override
  _homeBmiState createState() => _homeBmiState();
}

class _homeBmiState extends State<homeBmi> {
  bool isActive = true;
  late int weight = 74, age = 19;
  late double height = 183;
  late Size size;
  double value = 170.0;
  late double bmi = 22.1;
  String satuse = 'NORMAL';
  late Color statusColor;
  double hamwi = 71;
  late String tip = 'Is not status';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BasePlane(
      size: size,
      button: 'CALCULATE YOUR BMI',
      widgetBase: Expanded(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Gender(
                    text: 'Male',
                    iconData: Icons.male,
                    IsActive: isActive,
                    OnTapeed: () {
                      setState(() {
                        isActive = true;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Gender(
                    text: 'Female',
                    iconData: Icons.female,
                    IsActive: !isActive,
                    OnTapeed: () {
                      setState(() {
                        isActive = false;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  BoxContianer(
                    widgets: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'HEIGHT',
                          style: kStylegrey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              height.toString().replaceFirst('.0', ''),
                              style: kStylewhite.copyWith(fontSize: 70),
                            ),
                            Text(
                              'cm',
                              style: kStylegrey,
                            ),
                          ],
                        ),
                        Slider(
                          value: height,
                          max: 250,
                          min: 40,
                          onChanged: (value) {
                            setState(() {
                              height = value.round() * 1.0;
                            });
                          },
                          activeColor: kpinkColor,
                          inactiveColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  WeightAge(
                    text: 'WEIGHT',
                    number: weight.toString(),
                    inCrease: () {
                      setState(() {
                        changenumber(ChangeAge: false, isIn: true);
                      });
                    },
                    deCrease: () {
                      setState(() {
                        changenumber(ChangeAge: false, isIn: false);
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  WeightAge(
                    text: 'AGE',
                    number: age.toString(),
                    inCrease: () {
                      setState(() {
                        changenumber(ChangeAge: true, isIn: true);
                      });
                    },
                    deCrease: () {
                      setState(() {
                        changenumber(ChangeAge: true, isIn: false);
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
      navigat: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          List BmiList = bmifun();
          return Resalut(
            size: size,
            bmi: BmiList[0].toString(),
            tip: BmiList[1],
            satuse: BmiList[2],
            statusColor: BmiList[3],
            reset: (context) {
              reset(context);
            },
            hawmi: hamwifun(),
            Space: (hamwifun() - weight).toString(),advice: advicefun(),
          );
        }));
      },
    );
  }

  void changenumber({required bool isIn, required bool ChangeAge}) {
    if (ChangeAge) {
      if (isIn) {
        if (age < 120) {
          age++;
        } else {
          //pass
        }
      } else {
        if (age > 1) {
          age--;
        } else {
          //pass
        }
      }
    } else {
      if (isIn) {
        if (weight < 500) {
          weight++;
        } else {
          //pass
        }
      } else {
        if (weight > 5) {
          weight--;
        } else {
          //pass
        }
      }
    }
  }

  List bmifun() {
    double bmi = weight / pow((height / 100), 2);

    if (bmi >= 18.5 && bmi <= 25) {
      satuse = 'Normal';
      tip = 'You have a normal body weight. Good job!';
      statusColor = Colors.greenAccent;
    } else if (bmi < 18.5) {
      satuse = 'Under Weight';
      tip = 'You have a low body weight. try to eat more!';
      statusColor = Colors.red;
    } else {
      satuse = 'Over Weight';
      tip = 'You have a high body weight. try to eat less!';
      statusColor = Colors.red;
    }

    return [bmi, tip, satuse, statusColor];
  }

  double hamwifun() {
    //وزن ایده آل بدن مرد = ۴۸ کیلوگرم  + ۱,۱ کیلوگرم  × (قد (سانتی متر) – ۱۵۲)
    //وزن ایده آل بدن زن = ۴۵.۴ کیلوگرم  + ۰,۹ کیلوگرم  × (قد (سانتی متر) – ۱۵۲)
    if (isActive) {
      return hamwi = 48 + 1.1 * (height) - 152;
    } else {
      return hamwi = 45.4 + 0.9 * (height) - 152;
    }
  }

  String advicefun() {
    if (hamwi - weight < 0) {
      return 'Exercise a lot and minimize carbohydrate and sugar foods';
    } else if (hamwi - weight == 0) {
      return 'Your weight is appropriate and ideal';
    } else {
      return 'Eat more protein and carbohydrates';
    }
  }

  void reset(context) {
    setState(() {
      weight = 74;
      age = 19;
      height = 183;
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }
}
