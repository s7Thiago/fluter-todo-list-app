import 'package:chat_app/task_item.dart';
import 'package:flutter/material.dart';

class UpComingList extends StatefulWidget {
  List<TaskItem> tasks = [];

  // Get the inner list
  List<TaskItem> get list => tasks;

  UpComingList({Key key, this.tasks = const []}) : super(key: key);

  @override
  _UpComingListState createState() => _UpComingListState();
}

class _UpComingListState extends State<UpComingList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming'.toUpperCase(),
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
            itemCount: widget.tasks.length,
            itemBuilder: (BuildContext context, int index) =>
                widget.tasks[index],
          ),
        ],
      ),
    );
  }
}
