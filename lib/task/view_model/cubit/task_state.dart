abstract class TaskState{
  final List<dynamic> tasks;

  TaskState(this.tasks);
}

class TaskInitialState extends TaskState {
  List<dynamic> tasks;

  TaskInitialState(this.tasks) : super(tasks) ;
}