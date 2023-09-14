import 'package:flutter/material.dart';
import 'package:todo_application/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[200],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          //Get user Input
          TextField(
            controller: widget.controller,
              decoration: const InputDecoration(
                labelText: 'Enter text', // Placeholder text
                labelStyle: TextStyle(color: Colors.black), // Label text color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Change line color here
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black), // Change line color here
                ),
              ),
            ),


          //buttons save and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: widget.onSave ),
              const SizedBox(width: 5),
              MyButton(text: "Cancel", onPressed: widget.onCancel ),
            ],
          ),

        ]),
        ),

    );
  }
}