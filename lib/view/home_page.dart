import 'package:flutter/material.dart';
import 'package:todo_app/model/tasks_model.dart';
import 'package:todo_app/services/services.dart';
import 'package:todo_app/view/read.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  final Service _service = Service();
  TextEditingController taskController = TextEditingController();

  void saveAndPop(BuildContext context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Read_App()));
    String task = taskController.text.trim();
    var todo = TasksModel(task: task, tasks: []);
    await _service.addTask(todo);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Add Tasks"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Read_App()));
                },
                icon: Icon(Icons.list)),
          )
        ],
      ),
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 250,
              child: TextField(
                controller: taskController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Add Tasks"),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                saveAndPop(context);
              },
              child: Text("Add")),
        ],
      ),
    );
  }
}
