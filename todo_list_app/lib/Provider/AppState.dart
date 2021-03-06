import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:todo_list_app/Model/Todo.dart';
import 'package:todo_list_app/Utils/AppConst.dart';

class AppState with ChangeNotifier{
  List<Todo> todoList = [];
  Box<Todo> box;
  Todo todo;

 

  void getTodoList() async {
    var box = await Hive.openBox<Todo>(appBoxName);
    todoList = box.values.toList();
    notifyListeners();
  }

    void addTodo(Todo todo) async {
    var box = await Hive.openBox<Todo>(appBoxName);
    await box.add(todo);
    todoList = box.values.toList();
    notifyListeners();
  }

    void deleteTodo(key) async {
    var box = await Hive.openBox<Todo>(appBoxName);
    await box.deleteAt(key);
    todoList = box.values.toList();
    print("Deleted contact with key: " + key.toString());
    notifyListeners();
  }


  int get todoListCount {
    return todoList.length;
  }

    void editTodo({Todo todo, int contactKey}) async {
    var box = await Hive.openBox<Todo>(appBoxName);
    await box.putAt(contactKey, todo);
    todoList = box.values.toList();
    print('New Name Of Contact: ' + todo.title);
    notifyListeners();
  }


}