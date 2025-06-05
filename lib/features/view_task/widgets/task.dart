import 'package:flutter/material.dart';
import 'package:todo_animation/features/view_task/models/task.model.dart';
import 'package:todo_animation/features/view_task/widgets/sub_task.dart';

class Task extends StatelessWidget {
  final TaskModel? task;
  const Task({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isTaskCompleted =
        ValueNotifier(task?.isCompleted ?? false);

    void taskCompletionHandler(bool? value) {
      isTaskCompleted.value = value ?? false;
      // Here you can add logic to handle task completion, like updating the state or notifying the user
    }

    return Column(
      children: [
        SubTask(
          taskId: task?.id,
          nameTask: task?.title,
          group: task?.groupTask,
          ref: taskCompletionHandler,
        ),
        if (task?.subTasks != null)
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ValueListenableBuilder(
              valueListenable: isTaskCompleted,
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final subTask = task?.subTasks?[index];
                    return SubTask(
                      taskId: task?.id,
                      subTaskId: subTask?.id,
                      nameTask: subTask?.title,
                      isCompleted: value ? value : subTask?.isCompleted,
                      isEnableTask: !value,
                    );
                  },
                  itemCount: task?.subTasks?.length ?? 0,
                );
              },
            ),
          ),
      ],
    );
  }
}
