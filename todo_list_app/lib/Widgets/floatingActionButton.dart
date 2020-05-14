import 'package:flutter/material.dart';
import 'package:todo_list_app/Utils/AppColors.dart';

import 'dialogues.dart';


Widget displayAddButton(String tag,BuildContext context) {
  return FloatingActionButton(
    heroTag: tag,
    backgroundColor: AppColors.yellowColor,
    mini: false,
    onPressed: ()=>displayAddTodoDialogue(context),
    
    child: Icon(Icons.add,color: AppColors.blackTextColor,size: 50,),
  );
}