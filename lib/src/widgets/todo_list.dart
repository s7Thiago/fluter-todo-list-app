import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/styles.dart';
import './task_list_widget.dart';
import '../providers/tasks.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final upcomingTasks =
        Provider.of<Tasks>(context, listen: true).upcomingTasks;
    final finishedTasks =
        Provider.of<Tasks>(context, listen: true).finishedTasks;

    return Container(
      padding: const EdgeInsets.only(top: 70),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppStyles.primaryColorLight1,
            AppStyles.primaryColorLight2,
            AppStyles.primaryColorLight1,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: upcomingTasks.length > 0 ? 35 : 0),
            if (upcomingTasks.length > 0)
              TaskListWidget(
                title: 'upcoming',
                tasks: upcomingTasks,
              ),
            SizedBox(height: finishedTasks.length > 0 ? 35 : 0),
            if (finishedTasks.length > 0)
              TaskListWidget(
                title: 'finished',
                tasks: finishedTasks,
              ),
            SizedBox(height: 85),
          ],
        ),
      ),
    );
  }
}
