import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/floating_action_button.dart';
import '../widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TodoList(),
          AppBarWidget(),
        ],
      ),
      floatingActionButton: AppFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
