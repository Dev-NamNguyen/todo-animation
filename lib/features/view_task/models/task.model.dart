import 'package:todo_animation/features/view_task/models/group_task.model.dart';
import 'package:todo_animation/features/view_task/models/sub_task.model.dart';

class TaskModel extends SubTaskModel {
  GroupTaskModel? groupTask;
  List<SubTaskModel>? subTasks;

  TaskModel({
    required super.id,
    super.title,
    super.description,
    super.date,
    this.groupTask,
    this.subTasks,
    super.isCompleted = false,
  });

  TaskModel.fromJson(Map<String, dynamic>? json) : super.fromJson(json) {
    if (json != null) {
      groupTask = (json['groupTask'] != null
          ? GroupTaskModel.fromJson(json['groupTask'])
          : null);
      isCompleted = json['isCompleted'] as bool? ?? false;
      if (json['subTasks'] != null) {
        subTasks = (json['subTasks'] as List)
            .map((e) => SubTaskModel.fromJson(e))
            .toList();
      }
    }
  }
}
