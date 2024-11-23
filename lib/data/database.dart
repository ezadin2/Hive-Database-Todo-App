import 'package:hive/hive.dart';

class ToDoDatabase{
  List todoList = [];
  //reference the box
  final _mybox = Hive.box('mybox');
  //first Time opening the app
  void createInitialData(){
    todoList = [
      ['make Tutorial',false],
      ['Do Exercise',true],
    ];

  }
  //load
  void loadData(){
    todoList = _mybox.get("TODOLIST");
  }
  //load data from the database
  void updateDatabase(){
    _mybox.put('TODOLIST', todoList);
  }
}