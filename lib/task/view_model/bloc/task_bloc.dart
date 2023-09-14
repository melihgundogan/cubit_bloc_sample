import 'dart:async';

import 'package:cubit_bloc_sample/task/view_model/bloc/task_event.dart';
import 'package:cubit_bloc_sample/task/view_model/bloc/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitialState([])) {
    on<AddTaskEvent>(_onAddTask);
    on<ClearTasksEvent>(_onClearTasks);
    on<CompleteTaskEvent>(_onCompleteTask);
  }

  FutureOr<void> _onAddTask(AddTaskEvent event, Emitter<TaskState> emit) {
    final updatedTasks = List.from(state.tasks);
    updatedTasks.add(event.task);
    emit(TaskInitialState(updatedTasks));
  }

  FutureOr<void> _onClearTasks(ClearTasksEvent event, Emitter<TaskState> emit) {
    emit(TaskInitialState([]));
  }

  FutureOr<void> _onCompleteTask(
      CompleteTaskEvent event, Emitter<TaskState> emit) {
    final updatedTasks = List.from(state.tasks)..removeAt(event.index);
    emit(TaskInitialState(updatedTasks));
  }
}
