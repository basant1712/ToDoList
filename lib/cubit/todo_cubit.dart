import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  List tasks = [];
  TextEditingController controller = TextEditingController();
  TodoCubit() : super(TodoInitialState());

  void addTasks(String task) {
    tasks.add(task);
    controller.clear();
        emit(TodoSuccess());

  }

  void taskCompletion(int index) {
    tasks[index] = "✅ ${tasks[index]}";
    emit(TodoSuccess());
  }

  void deleteTasks(int index) {
    tasks.removeAt(index);
        emit(TodoSuccess());

  }
}
