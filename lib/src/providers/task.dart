import 'package:flutter/foundation.dart';

class Task with ChangeNotifier {
  final String id;
  final String title;
  bool isFinished;

  Task({
    @required this.id,
    @required this.title,
    this.isFinished = false,
  });

  void switchFinished() {
    isFinished = !isFinished;
    notifyListeners();
  }
}
