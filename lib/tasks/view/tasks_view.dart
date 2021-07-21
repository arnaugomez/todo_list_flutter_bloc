import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/tasks/cubit/tasks_cubit.dart';
import 'package:todo_list/tasks/models/task.dart';

class TasksView extends StatefulWidget {
  @override
  _TasksViewState createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  final inputController = new TextEditingController();
  String taskName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-do list"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextField(
                        controller: inputController,
                        onChanged: (text) {
                          setState(() {
                            taskName = text;
                          });
                        },
                        onSubmitted: (_) => onSubmitTask(context))),
                IconButton(
                    onPressed:
                        taskName.isEmpty ? null : () => onSubmitTask(context),
                    icon: Icon(Icons.send))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<TasksCubit, List<Task>>(builder: (context, tasks) {
              return Expanded(
                child: ListView(
                  children: tasks
                      .asMap()
                      .map((index, e) => MapEntry(
                          index,
                          Card(
                              child: ListTile(
                            title: Text(e.name),
                            subtitle: Text(e.id),
                            trailing: IconButton(
                                onPressed: () {
                                  context.read<TasksCubit>().removeTask(index);
                                },
                                icon: Icon(Icons.close)),
                          ))))
                      .values
                      .toList(),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  void onSubmitTask(BuildContext context) {
    if (taskName.isNotEmpty) {
      context.read<TasksCubit>().addTask(taskName);
      inputController.clear();
      setState(() {
        taskName = "";
      });
    }
  }
}
