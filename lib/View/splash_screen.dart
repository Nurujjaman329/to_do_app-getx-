import 'package:flutter/material.dart';
import 'package:getx_todo_app/View/to_do_list_app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 8),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.deepOrange, Colors.black]),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/icons/to_do.png',
                              width: 200.0,
                              height: 200.0,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'TODO LIST',
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'MVVP ARCHITECTURE WITH GETX',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return ToDoListApp();
          }
        });
  }
}
