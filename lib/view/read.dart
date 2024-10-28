import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/model/tasks_model.dart';
import 'package:todo_app/services/services.dart';

class Read_App extends StatefulWidget {
  const Read_App({super.key});

  @override
  State<Read_App> createState() => _Read_AppState();
}

class _Read_AppState extends State<Read_App> {
  final Service _service = Service();
  Future<void> openBox() async {
    await Hive.openBox<TasksModel>("taskBox");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List of task"),
          backgroundColor: Colors.black45,
        ),
        body: FutureBuilder(
          future: _service.getAllTodo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ValueListenableBuilder(
                valueListenable: Hive.box<TasksModel>('tasksBox').listenable(),
                builder: (context, box, _) {
                  if (box.values.isEmpty) {
                    return const Center(
                      child: Text(" No Task Addded"),
                    );
                  }
                  return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        var todo = box.getAt(index);
                        return Card(
                          child: ListTile(
                            trailing: IconButton(
                                onPressed: () {
                                  _service.deleteModel(index);
                                },
                                icon: Icon(Icons.delete)),
                            title: Text(todo?.task ?? ""),
                          ),
                        );
                      });
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
