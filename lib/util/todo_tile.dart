import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoTile extends StatelessWidget {
  final String text;
  final bool taskDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  TodoTile(
      {super.key,
      required this.text,
      required this.taskDone,
      required this.onChanged,
      required this.deleteFunction
      });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Slidable(
        endActionPane:ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(
                onPressed: deleteFunction,
                icon:Icons.delete,
              backgroundColor:Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              //check box
              Checkbox(value: taskDone, onChanged: onChanged),
              //task name
              Text(text, style:TextStyle(decoration: taskDone ? TextDecoration.lineThrough : TextDecoration.none)),
            ],
          ),
        ),
      ),
    );
  }
}
