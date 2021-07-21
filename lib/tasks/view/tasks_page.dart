import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/tasks/cubit/tasks_cubit.dart';

import '../tasks.dart';
import 'tasks_view.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class TasksPage extends StatelessWidget {
  /// {@macro counter_page}
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasksCubit(),
      child: TasksView(),
    );
  }
}
