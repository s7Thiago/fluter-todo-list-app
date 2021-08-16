import 'package:flutter/material.dart';
import '../utils/styles.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Center(
                child: Image.asset(
                  'assets/empty_list.png',
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 197,
                      right: MediaQuery.of(context).size.width * .41,
                      child: MessageCard(
                        message: 'Add some tasks',
                      ),
                    ),
                    Positioned(
                      top: 170,
                      right: MediaQuery.of(context).size.width * .4,
                      child: MessageCard(
                        message: 'Nothing to show',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MessageCard extends StatelessWidget {
  final String message;

  const MessageCard({
    Key key,
    this.message = 'No message',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 4,
        ),
        child: Text(
          message,
          style: AppStyles.textStyleTaskListContent,
        ),
      ),
    );
  }
}
