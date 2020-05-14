import 'package:flutter/material.dart';
import 'package:todo_list_app/Utils/AppStyle.dart'; 
 
 
//  Padding displayHeaderText(String text) {
//     return Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 5.0, horizontal: 25.0),
//                             child: Text(
//                               text,
//                               style: 
//                                    TextStyles.buttonFontText.copyWith(
//                                     fontWeight:FontWeight.w600
//                                   )
//                             ),
//                           );
//   }

  SizedBox displayEmptySpace() => SizedBox(height: 20);

  Padding textFieldHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      child: Text(
        text,
        style:  TextStyles.headerFontText,
      ),
    );
  }