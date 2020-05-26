import 'package:flutter/material.dart';

class TaskItem extends StatefulWidget {
  final String title;

  TaskItem({
    Key key,
    this.title = 'without title',
  }) : super(key: key);

  @override
  _TaskItemState createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool selected = false;

  _itemTapped() => setState(() {
        selected = !selected;
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? Theme.of(context).accentColor : Colors.transparent,
      child: ListTile(
        onTap: _itemTapped,
        leading: Text(
          '${widget.title}',
          style: TextStyle(
            color: selected ? Colors.black : Colors.grey,
            decoration: !selected ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: selected ? Colors.black : Theme.of(context).accentColor,
            ),
            onPressed: () {}),
      ),
    );
  }
}
