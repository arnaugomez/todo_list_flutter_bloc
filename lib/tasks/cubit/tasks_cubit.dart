import 'package:bloc/bloc.dart';
import 'package:todo_list/tasks/models/task.dart';

class TasksCubit extends Cubit<List<Task>> {
  TasksCubit() : super([]);

  void addTask(String name) => emit([Task.uuid(name: name), ...state]);

  void removeTask(int index) {
    List<Task> newList = List.from(state);
    newList.removeAt(index);
    emit(newList);
  }
}
