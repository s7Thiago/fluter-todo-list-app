import 'package:flutter/material.dart';
import 'package:todo_list_app/src/views/new_task_screen.dart';

import '../utils/styles.dart';
import '../utils/routes.dart';

class AppFab extends StatelessWidget {
  const AppFab({
    Key key,
  }) : super(key: key);

  _newTask(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        fullscreenDialog: false,
        maintainState: true,
        transitionDuration: Duration(milliseconds: 550), //550
        barrierDismissible: true,
        barrierColor: Colors.black54,
        pageBuilder: (ctx, _, __) {
          return NewTaskScreen();
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'newTask',
      child: Material(
        shadowColor: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            child: IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.add,
                color: AppStyles.primaryColorDark1,
              ),
              onPressed: () => _newTask(context),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
