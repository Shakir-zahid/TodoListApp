import 'package:flutter/material.dart';
import 'package:todo_list_app/Utils/AppColors.dart';
import 'package:todo_list_app/Utils/AppStyle.dart';


class TextFields {
  static Widget normalTextField(
    BuildContext context,TextEditingController controller,{String hintText,String initial}
    ){
   return Container(
       height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: controller,
       // initialValue: initial,
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, top: 10),
            hintText: hintText,
            fillColor: Colors.white,
            errorStyle: TextStyles.buttonFontText
                .copyWith(fontSize: 10, color: AppColors.redColor),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(width: 1, color: AppColors.redColor)),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
          ),
          style: TextStyles.textFieldFontText),
    );
  }



  static Widget largeTextField(
    BuildContext context,TextEditingController controller,{String hintText,String initial}
    ){
   return Container(
       height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        controller: controller,
          decoration: new InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, top: 10),
            hintText: hintText,
            fillColor: Colors.white,
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(),
            ),
          ),
          maxLines: 5,
          style:  TextStyles.textFieldFontText),
    );
  } 


}