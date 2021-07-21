

import 'package:todo_list/common/utils/uuid.dart';

class Task {
  String name;
  final String id;

  Task({required this.name, required this.id});

  factory Task.uuid({required String name}) {
    return Task(id: uuid.v4(), name: name);
  }

  toString() => "Task with ID $id: \n$name";
}