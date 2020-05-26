import 'package:chat_app/task_item.dart';
import 'package:chat_app/todo_list.dart';
import 'package:chat_app/up_coming_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String title;

  const Home({Key key, this.title = "Aula 2"}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _newTask(BuildContext context, ToDoList toDoList) {
    TextEditingController taskContentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextFormField(
          controller: taskContentController,
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('cancel')),
          FlatButton(
            onPressed: () {
              String taskContent = taskContentController.text;

              // Inserting task to inner task list
              setState(
                () {
                  toDoList.upComingList.list
                      .add(TaskItem(title: '$taskContent'));

                  print('content $taskContent');
                },
              );

              Navigator.of(context).pop();
            },
            child: Text('save'),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ToDoList toDoList = ToDoList(
      upComingList: UpComingList(
        tasks: [TaskItem()],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            '${widget.title}',
          ),
        ),
      ),
      body: toDoList,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _newTask(context, toDoList),
        splashColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
