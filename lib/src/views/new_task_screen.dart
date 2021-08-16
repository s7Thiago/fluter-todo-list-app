import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/providers/task.dart';
import 'package:todo_list_app/src/widgets/custom_input.dart';
import '../providers/tasks.dart';
import '../utils/styles.dart';

class NewTaskScreen extends StatelessWidget {
  /// Save a new task to the Tasks provider.
  _saveNewTask(BuildContext context, CustomInput input) {
    final provider = Provider.of<Tasks>(context, listen: false);

    if (!input.isEmpty) {
      provider.addTask(Task(title: input.content));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    final input = CustomInput();
    final size = MediaQuery.of(context).size;

    // Setting up onSubmitted
    input.setOnSubmitted = (content) {
      final provider = Provider.of<Tasks>(context, listen: false);

      if (!input.isEmpty) {
        provider.addTask(Task(title: content));
        Navigator.pop(context);
      }
    };

    print('size: $size');

    return Padding(
      padding: EdgeInsets.only(
        top: (size.height * .25).clamp(15.0, 300.0),
        bottom: (size.height * .25).clamp(150.0, 200.0),
        left: (size.width * (size.width < 1000 ? .1 : .35)).clamp(15.0, 800.0),
        right: (size.width * (size.width < 1000 ? .1 : .35)).clamp(15.0, 800.0),
      ),
      child: Hero(
        tag: 'newTask',
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Material(
              type: MaterialType.transparency,
              child: Card(
                semanticContainer: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 100),
                    input,
                    SizedBox(height: 100),
                    IconButton(
                      onPressed: () => _saveNewTask(context, input),
                      icon: Icon(Icons.save),
                      color: AppStyles.primaryColorLight1,
                      iconSize: 35,
                    ),
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
