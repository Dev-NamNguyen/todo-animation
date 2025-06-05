import 'package:flutter/material.dart';
import 'package:todo_animation/core/res/app.context.extension.dart';
import 'package:todo_animation/core/res/resources.dart';
import 'package:todo_animation/core/utils/utils.dart';
import 'package:todo_animation/features/view_task/models/group_task.model.dart';
import 'package:todo_animation/features/view_task/models/sub_task.model.dart';
import 'package:todo_animation/features/view_task/models/task.model.dart';
import 'package:todo_animation/features/view_task/widgets/head_title.dart';
import 'package:todo_animation/features/view_task/widgets/sub_task.dart';
import 'package:todo_animation/features/view_task/widgets/sum_type_task.dart';
import 'package:todo_animation/features/view_task/widgets/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<bool> _isScrollingNotifier = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.position.isScrollingNotifier
            .addListener(_checkIfScrollingStopped);
      }
    });
  }

  void _checkIfScrollingStopped() {
    _isScrollingNotifier.value =
        _scrollController.position.isScrollingNotifier.value;
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.position.isScrollingNotifier
        .removeListener(_checkIfScrollingStopped);
    _scrollController.dispose();
  }

  final List<TaskModel> tasks = [
    TaskModel(
      id: "1",
      title: "Morning Routine",
      description: "Complete morning tasks",
      date: getDate(),
      groupTask: GroupTaskModel(groupTask: "Health", color: "0xff7990f8"),
      subTasks: [
        SubTaskModel(id: "1.1", title: "Wake up early"),
        SubTaskModel(id: "1.2", title: "Exercise for 30 minutes"),
        SubTaskModel(id: "1.3", title: "Have a healthy breakfast"),
      ],
    ),
    TaskModel(
      id: "2",
      title: "Work Tasks",
      description: "Complete work-related tasks",
      date: getDate(),
      groupTask: GroupTaskModel(groupTask: "Work", color: "0xff46CF8B"),
      subTasks: [
        SubTaskModel(id: "2.1", title: "Attend team meeting"),
        SubTaskModel(id: "2.2", title: "Finish project report"),
        SubTaskModel(id: "2.3", title: "Reply to emails"),
      ],
    ),
    // Add more tasks as needed
    TaskModel(
      id: "3",
      title: "Mental Health",
      description: "Activities for mental well-being",
      date: getDate(),
      groupTask:
          GroupTaskModel(groupTask: "Mental Health", color: "0xffBC5EAD"),
      subTasks: [],
    ),
    TaskModel(
      id: "4",
      title: "Miscellaneous",
      description: "Other tasks",
      date: getDate(),
      groupTask: GroupTaskModel(groupTask: "Others", color: "0xff908986"),
      subTasks: [
        SubTaskModel(id: "4.1", title: "Grocery shopping"),
        SubTaskModel(id: "4.2", title: "Call a friend"),
        SubTaskModel(id: "4.3", title: "Plan weekend activities"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Resources resources = context.resources;

    return Scaffold(
        backgroundColor: resources.colors.primary,
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(resources.dimensions.primaryPadding),
          width: size.width,
          height: size.height,
          color: resources.colors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: HeadTitle(
                  title: "Today",
                  subTitle: getDate(),
                  onTap: () {
                    print("HeadTitle tapped");
                  },
                ),
              ),
              SizedBox(height: resources.dimensions.primaryPadding),
              GridView.count(
                  shrinkWrap: true,
                  primary: true,
                  childAspectRatio: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    SumTypeTask(
                      height: 25,
                      icon: const Icon(
                        Icons.heart_broken,
                        color: Color(0xfff7990f8),
                      ),
                      title: "6",
                      subTitle: "Health",
                      color: const Color(0xfff7990f8).withOpacity(0.2),
                    ),
                    SumTypeTask(
                      height: 25,
                      icon: const Icon(
                        Icons.task_rounded,
                        color: Color(0xfff46CF8B),
                      ),
                      title: "6",
                      subTitle: "Work",
                      color: const Color(0xfff46CF8B).withOpacity(0.2),
                    ),
                    SumTypeTask(
                      height: 25,
                      icon: const Icon(
                        Icons.monitor_heart,
                        color: Color(0xfffBC5EAD),
                      ),
                      title: "6",
                      subTitle: "Mental Health",
                      color: const Color(0xfffBC5EAD).withOpacity(0.2),
                    ),
                    SumTypeTask(
                      height: 25,
                      icon: const Icon(
                        Icons.file_copy,
                        color: Color(0xfff908986),
                      ),
                      title: "6",
                      subTitle: "Others",
                      color: const Color(0xfff908986).withOpacity(0.2),
                    ),
                  ]),
              SizedBox(
                height: resources.dimensions.primaryPadding,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: ListView.builder(
                            controller: _scrollController,
                            itemBuilder: (context, index) {
                              if (tasks[index].subTasks != null &&
                                  tasks[index].subTasks!.isNotEmpty) {
                                return Column(
                                  children: [
                                    Task(task: tasks[index]),
                                    const SizedBox(height: 10),
                                    const Divider(
                                      color: Colors.blueGrey,
                                      thickness: 1,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              }

                              final task = tasks[index];
                              return Column(
                                children: [
                                  SubTask(
                                    taskId: task.id,
                                    nameTask: task.title ?? "",
                                    group: task.groupTask,
                                  ),
                                  const SizedBox(height: 10),
                                  const Divider(
                                    color: Colors.blueGrey,
                                    thickness: 1,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              );
                            },
                            itemCount: tasks.length)),
                    ValueListenableBuilder(
                      valueListenable: _isScrollingNotifier,
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        return Positioned(
                          bottom: 10,
                          right: 10,
                          child: FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: _isScrollingNotifier.value
                                  ? Color(0xfff393433).withOpacity(0.2)
                                  : Color(0xfff393433),
                              child: Icon(
                                Icons.add,
                                color: resources.colors.primary,
                                size: size.width * 0.08,
                              )),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
