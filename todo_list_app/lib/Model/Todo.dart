
import 'package:hive/hive.dart';
part 'Todo.g.dart';

@HiveType(typeId:0)

class Todo{
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String imageUrl;

  Todo({this.title,this.description,this.imageUrl});
}