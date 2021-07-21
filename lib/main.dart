import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'tasks_observer.dart';

void main() {
  Bloc.observer = TasksObserver();
  runApp(const TasksApp());
}
