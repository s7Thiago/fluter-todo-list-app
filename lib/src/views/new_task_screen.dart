import 'package:flutter/material.dart';
import '../providers/tasks.dart';
import '../utils/styles.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * .25,
        bottom: MediaQuery.of(context).size.height * .2,
        left: 25,
        right: 25,
      ),
      child: Hero(
        tag: 'newTask',
        child: Material(
          type: MaterialType.transparency,
          child: Card(
            semanticContainer: true,
            child: Center(
              child: FittedBox(
                child: Text(
                  'Add a new task',
                  style: AppStyles.textStyleTaskListContent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
