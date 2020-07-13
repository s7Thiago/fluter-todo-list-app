import 'package:flutter/material.dart';
import '../utils/styles.dart';

class CustomInput extends StatelessWidget {
  TextEditingController _controller = TextEditingController();

  String get content => _controller.text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _controller,
        cursorColor: AppStyles.primaryColorDark1,
        cursorWidth: 3,
        cursorRadius: Radius.circular(1.5),
        decoration: InputDecoration(
          hintText: 'Type a title',
          border: InputBorder.none,
        ),
      ),
      decoration: BoxDecoration(
        color: AppStyles.accentColorWhite,
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
