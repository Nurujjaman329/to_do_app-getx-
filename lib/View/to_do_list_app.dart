import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/model.dart';
import '../ViewModel/controller.dart';
import 'task_details_screen.dart';

class ToDoListApp extends StatelessWidget {
  ToDoListApp({super.key});

  final TaskViewModel taskViewModel = Get.put(TaskViewModel());

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
              "TODO LIST",
              style: TextStyle(
                fontSize: 45.0,
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                  ],
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Add daily task",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: taskViewModel.controller,
              onFieldSubmitted: (value) =>
                  taskViewModel.addTask(taskTitle: value),
              decoration: InputDecoration(
                labelText: 'Enter Your Task',
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
              ),
              style: TextStyle(
                color: Colors.black,
              ),
              cursorColor: Colors.blue,
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pinkAccent,
                    Colors.lightBlueAccent,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  'Tasks',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: taskViewModel.tasks.length,
                  itemBuilder: (context, index) {
                    final task = taskViewModel.tasks[index];
                    return ListTile(
                      title: Text(
                        task.isCompleted ? '✅ ${task.title} ' : task.title,
                        style: TextStyle(
                          decoration: task.isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: task.isCompleted ? Colors.green : Colors.blue,
                          fontWeight: task.isCompleted
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: task.dueDate != null
                          ? Text(
                              'Due Date : ${task.dueDate!.toLocal()}',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            )
                          : null,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              taskViewModel.toggleTaskComplete(index);
                            },
                            child: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                            onTap: () {
                              taskViewModel.showDatePickerDialog(
                                  context, index);
                            },
                            child: Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          InkWell(
                            onTap: () {
                              taskViewModel.toggleTaskImportance(index);
                            },
                            child: Icon(
                              task.isImportant ? Icons.star : Icons.star_border,
                              color: task.isImportant
                                  ? Colors.amber
                                  : Colors.pinkAccent,
                            ),
                          ),
                        ],
                      ),
                      onLongPress: () {
                        taskViewModel.deleteTask(index);
                      },
                      onTap: () {
                        if (index < taskViewModel.tasks.length) {
                          Task task = taskViewModel.tasks[index];
                          Get.to(TaskDetailsScreen(
                            task: task,
                          ));
                        }
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
