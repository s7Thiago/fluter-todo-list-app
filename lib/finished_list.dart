import 'package:flutter/material.dart';

import 'task_item.dart';

class FinishedList extends StatefulWidget {
  final List<TaskItem> tasks;

  const FinishedList({Key key, this.tasks = const []}) : super(key: key);

  @override
  _FinishedListState createState() => _FinishedListState();
}

class _FinishedListState extends State<FinishedList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Finished'.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.tasks.length ?? 0,
            itemBuilder: (BuildContext context, int index) =>
                widget.tasks[index] ?? [index],
          ),
        ],
      ),
    );
  }
}
