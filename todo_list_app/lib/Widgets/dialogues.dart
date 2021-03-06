import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/Model/Todo.dart';
import 'package:todo_list_app/Provider/AppState.dart';
import 'package:todo_list_app/Utils/AppColors.dart';
import 'package:todo_list_app/Utils/AppConst.dart';
import 'package:todo_list_app/Utils/AppStyle.dart';
import 'HeaderText.dart';
import 'TextFields.dart';
import 'buttons.dart';

TextEditingController titleController = TextEditingController();
TextEditingController descriptionController = TextEditingController();

displayAddTodoDialogue(BuildContext context, bool isEdit,
    {String title, String description, int index}) {
        titleController.text = title;
  descriptionController.text = description;
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      final appState = Provider.of<AppState>(context, listen: false);
      return AlertDialog(
        contentPadding: EdgeInsets.all(0.0),
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
        content: ListView(shrinkWrap: true, children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Card(
              elevation: 0.0,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 15.0, right: 15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: TextFields.normalTextField(
                              context, titleController,
                              hintText: 'Title')),
                      displayEmptySpace(),
                      Center(
                        child: Container(
                          height: 100,
                          child: FadeInImage(
                              fit: BoxFit.cover,
                              placeholder: AssetImage('assets/802.gif'),
                              image: NetworkImage(imageUrl)),
                        ),
                      ),
                      displayEmptySpace(),
                      Center(
                          child: TextFields.largeTextField(
                              context, descriptionController,
                              hintText: 'Description')),
                      displayEmptySpace(),
                      (isEdit)
                          ? displayEditButton(context, appState, index)
                          : displayAddTodoButton(context, appState),
                      displayEmptySpace(),
                    ]),
              ),
            ),
          ),
        ]),
      );
    },
  );
}

Widget displayAddTodoButton(BuildContext context, AppState appState) {
  return Button(
    buttonText: 'Add Todo',
    buttonColor: AppColors.yellowColor,
    onTap: () {
      print('button tapped');

      Todo todo = Todo(
          title: (titleController.text != null) ? titleController.text : '',
          description: (descriptionController.text != null)
              ? descriptionController.text
              : '',
          imageUrl: imageUrl);
      appState.addTodo(todo);
      controllerDispose();
      Navigator.pop(context);
    },
    buttonTextStyle: TextStyles.buttonFontText,
    widthPercent: 0.8,
  );
}

Widget displayEditButton(BuildContext context, AppState appState, int index) {
  return Button(
    buttonText: 'Edit Todo',
    buttonColor: AppColors.yellowColor,
    onTap: () {
      print('button tapped');

      Todo todo = Todo(
          title: (titleController.text != null) ? titleController.text : '',
          description: (descriptionController.text != null)
              ? descriptionController.text
              : '',
          imageUrl: imageUrl);
      appState.editTodo(contactKey: index, todo: todo);
      controllerDispose();
      Navigator.pop(context);
    },
    buttonTextStyle: TextStyles.buttonFontText,
    widthPercent: 0.8,
  );
}

controllerDispose() {
  titleController.clear();
  descriptionController.clear();
}

