import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/todo_list.dart';
import '../utils/styles.dart';

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
      floatingActionButton: Material(
        shadowColor: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {},
          child: Container(
            child: IconButton(
              splashRadius: 25,
              icon: Icon(
                Icons.add,
                color: AppStyles.primaryColorDark1,
              ),
              onPressed: () {},
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
