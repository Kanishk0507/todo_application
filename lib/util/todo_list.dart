import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoList extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  Function(BuildContext)? editFunction;

  ToDoList({super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),),
        ]),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: widget.editFunction,
            icon: Icons.edit,
            backgroundColor: Colors.green,
            borderRadius: BorderRadius.circular(12),),
        ]),
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color:  const Color.fromARGB(255, 9, 92, 160),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color.fromARGB(255, 21, 120, 201), // Border color
              width: 2.0, // Border width
            ),
          ),

          child: Row(
            
            children: [
              // checkbox
              Checkbox(
              value: widget.taskCompleted, 
              onChanged: widget.onChanged,
              activeColor: const Color.fromARGB(255, 34, 197, 247),
              ),
              // taskname
              
              Text(
              widget.taskName,
              style : TextStyle(
                  color: Colors.white,
                  decoration: widget.taskCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
                ),
              ),
            ],
          ), 
        ),       
        ),
    );
  }
}
