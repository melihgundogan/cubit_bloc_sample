abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String task;

  AddTaskEvent(this.task);
}

class ClearTasksEvent extends TaskEvent {}

class CompleteTaskEvent extends TaskEvent {
  final int index;

  CompleteTaskEvent(this.index);
}