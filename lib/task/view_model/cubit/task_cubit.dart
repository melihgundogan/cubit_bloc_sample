import 'package:cubit_bloc_sample/task/view_model/cubit/task_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit(): super(TaskInitialState([]));

  void addTask(String task) {
    final updatedTasks = List.from(state.tasks);
    updatedTasks.add(task);
    emit(TaskInitialState(updatedTasks));
  }

  void clearTasks(){
    emit(TaskInitialState([]));
  }

  void completedTask(int index){
    final updatedTasks = List.from(state.tasks)..removeAt(index);
    emit(TaskInitialState(updatedTasks));
  }
}

//complete 

