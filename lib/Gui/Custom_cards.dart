import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Services/Task.dart';
import 'package:ionicons/ionicons.dart';

class Custom_Card_Todo extends StatelessWidget {
  const Custom_Card_Todo({Key? key, required this.w, required this.task})
      : super(key: key);
  final Task task;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.green,
      elevation: 20,
      child: InkWell(
        splashColor: Color.fromARGB(255, 2, 85, 10).withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: SizedBox(
          width: w * 6 / 7,
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                            child: Text(
                          task.gradeLevel.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (task.gradeLevel == 1)
                              ? Color.fromARGB(255, 226, 10, 10)
                              : (task.gradeLevel == 2)
                                  ? Color.fromARGB(255, 217, 94, 0)
                                  : (task.gradeLevel == 3)
                                      ? Color.fromARGB(255, 16, 167, 3)
                                      : (task.gradeLevel == 4)
                                          ? Color.fromARGB(255, 2, 230, 255)
                                          : Color.fromARGB(255, 47, 1, 227),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0.0),
                    child: Text(
                      task.superTask,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(52, 0, 0, 0.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    task.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(52, 0, 0, 0.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    task.description,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_Card_Review extends StatelessWidget {
  const Custom_Card_Review({
    Key? key,
    required this.w,
    required this.task,
  }) : super(key: key);

  final double w;
  final Task task;

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    if (task.confirmedBy.contains("Ayrton")) counter++;
    if (task.confirmedBy.contains("Leonardo")) counter++;
    if (task.confirmedBy.contains("Lorenzo")) counter++;
    if (task.confirmedBy.contains("Martina")) counter++;
    return Card(
      shadowColor: Colors.green,
      elevation: 20,
      child: InkWell(
        splashColor: Color.fromARGB(255, 2, 85, 10).withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
          print(task.completedBy);
        },
        child: SizedBox(
          width: w * 6 / 7,
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                            child: Text(
                          task.gradeLevel.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (task.gradeLevel == 1)
                              ? Color.fromARGB(255, 226, 10, 10)
                              : (task.gradeLevel == 2)
                                  ? Color.fromARGB(255, 217, 94, 0)
                                  : (task.gradeLevel == 3)
                                      ? Color.fromARGB(255, 16, 167, 3)
                                      : (task.gradeLevel == 4)
                                          ? Color.fromARGB(255, 2, 230, 255)
                                          : Color.fromARGB(255, 47, 1, 227),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0.0),
                    child: Text(
                      task.superTask,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  globals.name == task.completedBy
                      ? Text(
                          "(" + task.dateTime + ")",
                          style: TextStyle(fontSize: 15),
                        )
                      : Text(
                          "(" + task.completedBy + "-" + task.dateTime + ")",
                          style: TextStyle(fontSize: 15),
                        ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0.0),
                    child: Text(
                      counter.toString() + "/3",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(52, 0, 0, 0.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        task.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    globals.name == task.completedBy
                        ? Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0.0),
                            child: Icon(
                              Ionicons.checkmark_done_circle_outline,
                              size: 12,
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0.0),
                            child: Icon(
                              Ionicons.close_circle_outline,
                              size: 12,
                            ),
                          )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(52, 0, 0, 0.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    task.description,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Custom_Card_Completed extends StatelessWidget {
  const Custom_Card_Completed({
    Key? key,
    required this.task,
    required this.w,
  }) : super(key: key);

  final Task task;
  final double w;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.green,
      elevation: 20,
      child: InkWell(
        splashColor: Color.fromARGB(255, 2, 85, 10).withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
          print(task.completedBy);
        },
        child: SizedBox(
          width: w * 6 / 7,
          height: 100,
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 30,
                        height: 30,
                        child: Center(
                            child: Text(
                          task.gradeLevel.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (task.gradeLevel == 1)
                              ? Color.fromARGB(255, 226, 10, 10)
                              : (task.gradeLevel == 2)
                                  ? Color.fromARGB(255, 217, 94, 0)
                                  : (task.gradeLevel == 3)
                                      ? Color.fromARGB(255, 16, 167, 3)
                                      : (task.gradeLevel == 4)
                                          ? Color.fromARGB(255, 2, 230, 255)
                                          : Color.fromARGB(255, 47, 1, 227),
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0.0),
                    child: Text(
                      task.superTask,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  globals.name == task.completedBy
                      ? Text(
                          "(" + task.dateTime + ")",
                          style: TextStyle(fontSize: 15),
                        )
                      : Text(
                          "(" + task.completedBy + "-" + task.dateTime + ")",
                          style: TextStyle(fontSize: 15),
                        ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(52, 0, 0, 0.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        task.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(52, 0, 0, 0.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    task.description,
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
