import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/providers/task.dart';
import 'package:todo_list_app/src/widgets/custom_input.dart';

import '../providers/tasks.dart';

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

    return Padding(
      padding: EdgeInsets.only(
        top: (size.height * .24).clamp(15.0, 300.0),
        bottom: (size.height * .35).clamp(200.0, 400.0),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 290,
                child: Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(),
                        input,
                        SizedBox(),
                        ElevatedButton(
                          onPressed: () => _saveNewTask(context, input),
                          child: Text('Save'),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.teal),
                          ),
                        ),
                        // SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
