import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todotask/data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _mybox = Hive.box('mybox');
  ToDoDatabase db = ToDoDatabase();
  //list of Todo tasks
  void taskCheck(int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
  }
  //TextController
@override
  void initState() {
    // TODO: implement initState
  //if the frst time opining
  if(_mybox.get('TODOLIST') == null){
    db.createInitialData();
  }else{
    //already exsts data
  db.loadData();
  }
    super.initState();
  }
  final controller = TextEditingController();

  
  //save new Task
  void saveNewTask() {
    setState(() {
      db.todoList.add([controller.text, false]);
      controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create a  new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }
//delete Task
  void deleteTask(int index){
    setState((){
      db.todoList.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Center(child: Text("To Do")),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
          ),
          backgroundColor: Colors.yellow,
        ),
        body: ListView.builder(
            itemCount: db.todoList.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskDone: db.todoList[index][1],
                text: db.todoList[index][0],
                onChanged: (value) => taskCheck(index),
                deleteFunction: (BuildContext) => deleteTask(index),
              );
            }));
  }
}
