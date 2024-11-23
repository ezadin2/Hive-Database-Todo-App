import 'package:flutter/material.dart';

import 'my_Button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow[300],
        content: Container(
            height: 120,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //get user input
                  TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Add a New Task')),

                  //Buttons -> save and cancel
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //save Button
                        MyButton(
                          text: 'save',
                          onPressed: onSave,
                        ),
                        //Cancel Button

                        MyButton(
                          text: 'cancel',
                          onPressed: onCancel,
                        )
                      ])
                ])));
  }
}
