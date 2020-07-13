import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/providers/task.dart';
import 'package:todo_list_app/src/widgets/custom_input.dart';
import '../providers/tasks.dart';
import '../utils/styles.dart';

class NewTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    final paddingTop = MediaQuery.of(context).size.height * .5;
    final paddingBottom = MediaQuery.of(context).size.height * .3;
    final input = CustomInput();

    _saveNewTask(BuildContext context) {
      final provider = Provider.of<Tasks>(context, listen: false);

      provider.addTask(Task(title: input.content));
      Navigator.pop(context);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: keyboardSize > 0 ? keyboardSize + 10 : paddingTop - 75,
        bottom: keyboardSize > 0 ? keyboardSize + 10 : paddingBottom,
        left: 25,
        right: 25,
      ),
      child: Hero(
        tag: 'newTask',
        child: Material(
          type: MaterialType.transparency,
          child: Card(
            child: FittedBox(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * .4),
                      child: Text(
                        'Add a new task',
                        style: AppStyles.textStyleTaskListContent,
                      ),
                    ),
                    input,
                    Padding(
                      padding: const EdgeInsets.only(right: 16, top: 20),
                      child: RaisedButton(
                        onPressed: () => _saveNewTask(context),
                        child: Text(
                          'Save',
                          style: AppStyles.textStyleAppBarTitle.copyWith(
                            fontSize: 18,
                          ),
                        ),
                        color: AppStyles.primaryColorLight1,
                      ),
                    )
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
