import 'package:flutter/material.dart';
import '../utils/styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      alignment: Alignment.center,
      // color: AppStyles.accentColorRed,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
            .65,
            .8,
          ],
              colors: [
            AppStyles.primaryColorLight1,
            AppStyles.primaryColorLight2.withOpacity(.0),
          ])),
      child: Text(
        'DAILIST',
        style: AppStyles.textStyleAppBarTitle,
      ),
    );
  }
}
