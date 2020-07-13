import 'package:flutter/material.dart';

import '../providers/task.dart';
import '../utils/styles.dart';
import '../widgets/task_item.dart';

class TaskListWidget extends StatelessWidget {
  final String title;
  final List<Task> tasks;

  TaskListWidget({
    this.title = 'List title',
    this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16),
            width: double.infinity,
            child: Text(
              title.toUpperCase(),
              style: AppStyles.textStyleTaskListTitle,
            ),
          ),
          ...List.generate(
            tasks.length,
            (index) => TaskItem(
              task: tasks[index],
            ),
          ).toList()
        ],
      ),
    );
  }
}
