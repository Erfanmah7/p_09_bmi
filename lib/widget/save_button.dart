import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';

class SaveButton extends StatelessWidget {
  VoidCallback onPressd;

  SaveButton({required this.onPressd});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kbluelightButtomColor,
      onPressed: onPressd,
      child: Text('SAVE RESULT'),
      minWidth: 200,
      height: 50,
    );
  }
}
