import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/providers/task.dart';
import 'package:todo_list_app/src/widgets/custom_input.dart';
import '../providers/tasks.dart';
import '../utils/styles.dart';

class NewTaskScreen extends StatelessWidget {
  _saveNewTask(BuildContext context, CustomInput input) {
    final provider = Provider.of<Tasks>(context, listen: false);

    if (!input.isempty) {
      provider.addTask(Task(title: input.content));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    final input = CustomInput();

    // Setting up onSubmitted
    input.setOnsubimitted = (content) {
      final provider = Provider.of<Tasks>(context, listen: false);

      if (!input.isempty) {
        provider.addTask(Task(title: content));
        Navigator.pop(context);
      }
    };

    return Hero(
      tag: 'newTask',
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(.7),
          body: Align(
            alignment:
                keyboardSize > 0 ? Alignment.bottomCenter : Alignment.center,
            child: Card(
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    input,
                    IconButton(
                      onPressed: () => _saveNewTask(context, input),
                      icon: Icon(Icons.save),
                      color: AppStyles.primaryColorLight1,
                      iconSize: 35,
                    ),
                    SizedBox(width: 2)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
