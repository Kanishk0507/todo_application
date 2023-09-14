import 'package:flutter/material.dart';
import 'package:todo_application/util/dialog_box.dart';
import 'package:todo_application/util/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //List todo Tasks
  List toDoList = [
  ];

  //checkbox tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  //save new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    
    const snackBar = SnackBar(
      content: Text('Task Added Successfully'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //Add new Task
  void createNewTask(){
    showDialog(
        context: context, 
        builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
    },
    );
  }

  //edit task
  void editTask(int index){
    showDialog(
    context: context,
    builder: (context){
    return DialogBox(
      controller: _controller, 
      onSave: (){
        setState(() {
          toDoList[index][0] = _controller.text;
        });
        Navigator.of(context).pop(); 
        _controller.clear();
        const snackBar = SnackBar(
      content: Text('Task Updated Successfully'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);       
      }, onCancel: () => Navigator.of(context).pop(),);
    });
  }

    //Delete task
    void deleteTask(int index){
      setState(() {
        toDoList.removeAt(index);
        const snackBar = SnackBar(
      content: Text('Task Deleted Successfully'),
      duration: Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 88, 177, 250),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 9, 92, 160),
      title: const Text('TO DO LIST'),
      centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 9, 92, 160),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: 
      ListView.builder(
        itemCount: toDoList.length,
      itemBuilder: (context, index) {
        return ToDoList(
        taskName: toDoList[index][0], 
        taskCompleted: toDoList[index][1], 
        onChanged: (value) => checkBoxChanged(value,index),
        deleteFunction: (context) => deleteTask(index),
        editFunction: (context) => editTask(index),
        );
      },
      ),
    );
  }
}