import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/views/home.dart';
import 'src/views/new_task_screen.dart';

import 'src/utils/routes.dart';
import 'src/utils/styles.dart';

import 'src/providers/tasks.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: AppStyles.accentColorWhite,
        ),
        routes: {
          AppRoutes.HOME: (_) => HomeScreen(),
          AppRoutes.NEW_TASK: (_) => NewTaskScreen(),
        },
      ),
    );
  }
}
