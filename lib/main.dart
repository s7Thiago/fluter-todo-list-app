import 'package:flutter/material.dart';

import 'home_widget.dart';

main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(),
      home: Home(
        title: 'To do List',
      ),
    );
  }
}
