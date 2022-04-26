import 'package:flutter/material.dart';
import 'package:p_09_bmi/style.dart';

class Gender extends StatelessWidget {
  final String text;
  final IconData iconData;
  final bool IsActive;
  final VoidCallback OnTapeed;

  Gender(
      {required this.text, required this.iconData, required this.IsActive,required this.OnTapeed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: (IsActive) ? kblueblButtonColor : kbluelightColor,
        child: InkWell(
          onTap: OnTapeed,
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 130,
            height: size.height * 0.19,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  color: (IsActive) ? Colors.white : Colors.grey,
                  size: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: (IsActive) ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
