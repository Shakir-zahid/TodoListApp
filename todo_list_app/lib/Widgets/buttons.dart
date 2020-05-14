  
import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  String buttonText;
  Color buttonColor;
  VoidCallback onTap;
  TextStyle buttonTextStyle;
  double widthPercent;

  Button({this.buttonText,this.buttonColor,this.onTap,this.buttonTextStyle,this.widthPercent});
  double width,height;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed:onTap,
      color: buttonColor,
      shape: StadiumBorder(),
      minWidth: width * widthPercent,
      
      height: 48,
      child: Text(buttonText,style:buttonTextStyle.copyWith(fontWeight: FontWeight.bold)),
    );
  }

}