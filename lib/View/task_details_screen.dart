import 'package:flutter/material.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          kToolbarHeight + 50.0,
        ),
        child: AppBar(
          title: Padding(
            padding: EdgeInsets.only(
              top: 16.0,
            ),
            child: Text(
              "Task Details Screen",
              style: TextStyle(
                fontSize: 25.0,
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ).createShader(
                    Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                  ),
              ),
            ),
          ),
          centerTitle: true,
          elevation: 1,
        ),
      ),
    );
  }
}
