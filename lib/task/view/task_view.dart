import 'package:cubit_bloc_sample/task/view_model/bloc/task_bloc.dart';
import 'package:cubit_bloc_sample/task/view_model/bloc/task_event.dart';
import 'package:cubit_bloc_sample/task/view_model/bloc/task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Görev Listesi '),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration:
                        const InputDecoration(labelText: 'Yeni Görev Ekle'),
                    controller: taskController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read<TaskBloc>()
                                .add(AddTaskEvent(taskController.text));
                            taskController.clear();
                          },
                          child: const Text('Ekle')),
                      ElevatedButton(
                          onPressed: () {
                            context.read<TaskBloc>().add(ClearTasksEvent());
                          },
                          child: const Text('Hepsini Sil')),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.tasks[index]),
                        trailing: IconButton(
                            onPressed: () {
                              context
                                  .read<TaskBloc>()
                                  .add(CompleteTaskEvent(index));
                            },
                            icon: const Icon(Icons.done)),
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
