import 'package:flutter/material.dart';

import 'tasks/view/tasks_page.dart';

/// {@template counter_app}
/// A [MaterialApp] which sets the `home` to [TasksPage].
/// {@endtemplate}
class TasksApp extends MaterialApp {
  /// {@macro counter_app}
  const TasksApp({Key? key}) : super(key: key, home: const TasksPage());
}