import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/Model/Todo.dart';
import 'package:todo_list_app/Provider/AppState.dart';
import 'package:todo_list_app/Utils/AppColors.dart';
import 'package:todo_list_app/Utils/AppConst.dart';
import 'package:todo_list_app/Utils/AppStyle.dart';
import 'package:todo_list_app/Widgets/appBar.dart';
import 'package:todo_list_app/Widgets/dialogues.dart';
import 'package:todo_list_app/Widgets/floatingActionButton.dart';

class HomePage extends StatelessWidget {
  Widget _body() {
    return Consumer<AppState>(builder: (context, appState, child) {
      return ListView.separated(
        itemCount: appState.todoListCount,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            onTap: () {
              displayEditTodoDialogue(
                context,
                index,
                title: appState.todoList[index].title,
                description: appState.todoList[index].description,
              ); // appState.deleteContact(index);
            },
            leading: Container(
                child: FadeInImage(
              fit: BoxFit.cover,
              placeholder: AssetImage('assetName'),
              image: NetworkImage(appState.todoList[index].imageUrl),
            )),
            title: Text(
              appState.todoList[index].title,
              style: TextStyles.normalFontText,
            ),
            subtitle: Text(
              appState.todoList[index].description,
              style: TextStyles.textFieldFontText,
            ),
            trailing: IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  size: 40,
                  color: AppColors.redColor,
                ),
                onPressed: () => appState.deleteContact(index)),
          );
        },
        separatorBuilder: (_, index) => Divider(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    appState.getTodoList();
    return SafeArea(
      child: Scaffold(
        appBar: displayAppBar(context),
        floatingActionButton: displayAddButton('AddDialogue', context),
        body: _body(),
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}
