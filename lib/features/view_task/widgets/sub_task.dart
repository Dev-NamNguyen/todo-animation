import 'package:flutter/material.dart';
import 'package:todo_animation/core/extensions/string.extension.dart';
import 'package:todo_animation/core/res/app.context.extension.dart';
import 'package:todo_animation/core/res/resources.dart';
import 'package:todo_animation/core/utils/utils.dart';
import 'package:todo_animation/features/view_task/models/group_task.model.dart';

class SubTask extends StatefulWidget {
  final String? taskId;
  final String? subTaskId;
  final bool? isCompleted;
  final String? nameTask;
  final Function(bool)? ref;
  final GroupTaskModel? group;
  final bool? isEnableTask;
  const SubTask(
      {super.key,
      required this.taskId,
      required this.nameTask,
      this.ref,
      this.subTaskId,
      this.isCompleted = false,
      this.group,
      this.isEnableTask = true});

  @override
  State<SubTask> createState() => _SubTaskState();
}

class _SubTaskState extends State<SubTask> {
  bool _isCompleted = false;

  void changeValue(bool? value) {
    setState(() {
      _isCompleted = value!;
    });
  }

  @override
  void initState() {
    super.initState();
    _isCompleted = widget.isCompleted ?? false;
  }

  @override
  void didUpdateWidget(covariant SubTask oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isCompleted!) {
      setState(() {
        _isCompleted = widget.isCompleted ?? oldWidget.isCompleted!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Dismissible(
      key: Key(widget.nameTask ?? ""),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isCompleted
                  ? "Task '${widget.nameTask}' completed"
                  : "Task '${widget.nameTask}' uncompleted",
            ),
          ),
        );
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(
            horizontal: resources.dimensions.primaryPadding),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 24.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color: widget.isCompleted == true
                        ? resources.colors.primary
                        : resources.colors.subtitle),
                borderRadius: BorderRadius.circular(
                    resources.dimensions.primaryRadius - 5)),
            value: _isCompleted,
            onChanged: widget.isEnableTask!
                ? (value) {
                    changeValue(value);
                    widget.ref?.call(value!);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     duration: const Duration(seconds: 1),
                    //     content: Text(
                    //       _isCompleted
                    //           ? "Task '${widget.nameTask}' completed"
                    //           : "Task '${widget.nameTask}' uncompleted",
                    //     ),
                    //   ),
                    // );
                  }
                : null,
            activeColor: widget.isEnableTask!
                ? resources.colors.checkActive
                : resources.colors.checkActive.withOpacity(0.3),
            checkColor: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nameTask ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.subTaskId == null || widget.subTaskId!.isEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: resources.dimensions.primaryPadding - 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            resources.dimensions.primaryRadius - 5),
                        color: getColorFromHex(widget.group?.color ?? "")
                            .withOpacity(0.1),
                      ),
                      child: Text(
                        widget.group?.groupTask?.capitalizeFirstLetter ?? "",
                        style: TextStyle(
                            color: getColorFromHex(widget.group?.color ?? ""),
                            fontSize: resources.sizes.primaryText - 2),
                      ),
                    ),
                ]),
          ),
        ],
      ),
    );
  }
}
