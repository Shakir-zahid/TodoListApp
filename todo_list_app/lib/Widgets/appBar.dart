import 'package:flutter/material.dart';
import 'package:todo_list_app/Utils/AppColors.dart';
import 'package:todo_list_app/Utils/AppConst.dart';
import 'package:todo_list_app/Utils/AppStyle.dart';



Widget displayAppBar(BuildContext context){
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    elevation: 0.0,
    title: Text(appName,style: TextStyles.normalFontText,),
  );
}