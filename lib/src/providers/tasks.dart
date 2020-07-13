import 'dart:math';

import 'package:flutter/widgets.dart';
import 'task.dart';

class Tasks with ChangeNotifier {
  List<Task> _items = [..._fakeTtems];

  static List<Task> _fakeTtems = List.generate(
    15,
    (index) => Task(
        id: Random().nextDouble().toString(),
        title: '${index < 9 ? '0' : ''}${index + 1}. Task',
        isFinished: index % 2 != 0),
  );

  List<Task> get tasks => [..._items];

  int get itemCount => _items.length;

  List<Task> get upcomingTasks =>
      [..._items.where((task) => !task.isFinished).toList()];

  List<Task> get finishedTasks =>
      [..._items.where((task) => task.isFinished).toList()];

  void updateListeners() {
    notifyListeners();
  }

  void removeTask(Task task) {
    _items.removeWhere((innerTask) => task.id == innerTask.id);
    notifyListeners();
  }

  void addTask(Task task) {
    var id = (itemCount + 1).toString();

    _items.insert(
      0,
      Task(
        id: id,
        title: ' $id. ${task.title}',
      ),
    );
    notifyListeners();
  }
}
