import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/styles.dart';
import '../providers/task.dart';
import '../providers/tasks.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  TaskItem({this.task});

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          widget.task.switchFinished();
          Provider.of<Tasks>(context, listen: false).updateListeners();
        }
      },
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 2.5,
          color: widget.task.isFinished
              ? AppStyles.primaryColorLight3
              : AppStyles.accentColorWhite,
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Text(
              widget.task.title + ' finished: ${widget.task.isFinished}',
              style: widget.task.isFinished
                  ? AppStyles.textStyleTaskListTitle.copyWith(
                      decoration: TextDecoration.lineThrough,
                    )
                  : AppStyles.textStyleTaskListContent,
            ),
          ),
        ),
      ),
    );
  }
}
