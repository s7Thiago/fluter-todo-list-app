import 'package:flutter/material.dart';

import 'finished_list.dart';
import 'task_item.dart';
import 'up_coming_list.dart';

class ToDoList extends StatefulWidget {
  UpComingList upComingList;
  FinishedList finishedList;

  get upComing => upComingList;

  ToDoList({
    Key key,
    this.upComingList,
    this.finishedList,
  }) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          widget.upComingList ??
              UpComingList(
                tasks: [
                  TaskItem(title: 'first task'),
                  TaskItem(title: 'second task'),
                ],
              ),
          widget.finishedList ??
              FinishedList(
                tasks: List.of(<Iterable<>>() {

                  Iterable<dynamic> a [];

                  for(i in 100){
                    a.
                  }
                }).map((e) => TaskItem(title: e)).toList(),
              ),
        ],
      ),
    );
  }
}
