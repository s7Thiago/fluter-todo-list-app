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
    return IconTheme(
      data: IconThemeData(
        color: widget.task.isFinished
            ? AppStyles.primaryColorDark1
            : AppStyles.accentColorRed,
      ),
      child: Dismissible(
        key: ValueKey(widget.task.id),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) {
          if (direction == DismissDirection.startToEnd) {
            widget.task.switchFinished();
            Provider.of<Tasks>(context, listen: false).updateListeners();
          }
        },
        background: Container(
          padding: const EdgeInsets.only(left: 16),
          alignment: Alignment.centerLeft,
          width: double.infinity,
          child: Icon(
            Icons.done_all,
            color: widget.task.isFinished
                ? AppStyles.accentColorWhite
                : AppStyles.primaryColorDark1,
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Card(
            elevation: 2.5,
            color: widget.task.isFinished
                ? AppStyles.primaryColorLight3
                : AppStyles.accentColorWhite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                    ),
                    onPressed: () {
                      final provider =
                          Provider.of<Tasks>(context, listen: false);

                      provider.removeTask(widget.task);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
