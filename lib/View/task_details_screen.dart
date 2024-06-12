import 'package:flutter/material.dart';
import 'package:getx_todo_app/Model/model.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;
  const TaskDetailsScreen({super.key, required this.task});

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
      body: Padding(
        padding: EdgeInsets.only(
          top: 8.0,
          left: 15.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(colors: [Colors.blue, Colors.purple])
                    .createShader(bounds);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                top: 5.0,
              ),
              child: Text(
                'Due Date : ${task.dueDate != null ? task.dueDate!.toLocal().toString() : 'No Due Date'}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [Colors.orange, Colors.pink],
                    ).createShader(
                      Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                    ),
                ),
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.orange, Colors.pink],
                ).createShader(bounds);
              },
              child: Text(
                'Priority : ${task.priority}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                ).createShader(bounds);
              },
              child: Text(
                'Important : ${task.isImportant ? 'Yes' : 'No'}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
