import 'package:flutter/material.dart';
import 'package:getx_todo_app/View/to_do_list_app.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 10),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset('assets/icons/to_do.png'),
                          ),
                        ],
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
