import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';
import 'button_alert.dart';

class Alert extends StatelessWidget {

  final Size size;
  final VoidCallback onNo,onYes;
  Alert(this.size,this.onNo,this.onYes);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kbluelightButtomColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
      title: Text('Please select one of the options',style: TextStyle(fontSize: 17),),
      content: Container(
        height: 50,
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: MyButton(size, 'back',onYes, 0.1, kblueblButtonColor),
              ),
              SizedBox(width: 15,),
              Expanded(
                child: MyButton(size, 'reset',onNo, 0.1, kblueblButtonColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}