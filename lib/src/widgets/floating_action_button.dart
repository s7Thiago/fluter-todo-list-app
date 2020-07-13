import 'package:flutter/material.dart';
import '../utils/styles.dart';

class AppFab extends StatelessWidget {
  const AppFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
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
    );
  }
}
