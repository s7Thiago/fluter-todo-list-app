import 'package:flutter/material.dart';

class AppStyles {
  //Main color palete
  static final Color primaryColorDark1 = Color(0xFF3E7781);
  static final Color primaryColorDark2 = Color(0xFF5C5C5C);
  static final Color primaryColorLight1 = Color(0xFF72B1BC);
  static final Color primaryColorLight2 = Color(0xFFA2D4DD);
  static final Color primaryColorLight3 = Color(0xFF9ED1DB);
  static final Color accentColorWhite = Color(0xFFF4F3F3);
  static final Color accentColorRed = Color(0xFFE5748D);

  // TextStyles
  static final TextStyle textStyleAppBarTitle = TextStyle(
    color: accentColorWhite,
    fontSize: 25,
  );

  static final TextStyle textStyleTaskListTitle = textStyleAppBarTitle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextStyle textStyleTaskListContent =
      textStyleTaskListTitle.copyWith(
    color: primaryColorDark2,
    fontWeight: FontWeight.w900,
  );
}
