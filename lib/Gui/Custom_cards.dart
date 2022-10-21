import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Services/Task.dart';
import 'package:ionicons/ionicons.dart';
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;

class Custom_Card_Todo extends StatelessWidget {
  const Custom_Card_Todo({
    Key? key,
    required this.w,
    required this.task,
    required this.job,
  }) : super(key: key);
  final Task task;
  final double w;
  final String job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                functions.delete_task(task: task, job: job);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                functions.ToDo_to_Review(task: task, job: job);
              },
              backgroundColor: Colors.green,
              icon: Icons.check_outlined,
            ),
          ],
        ),
        child: Card(
          shadowColor: globals.standard_color,
          elevation: 20,
          child: InkWell(
            splashColor: globals.standard_color.withAlpha(30),
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
                                  ? globals.standard_color.withOpacity(0.6)
                                  : (task.gradeLevel == 2)
                                      ? globals.standard_color.withOpacity(0.7)
                                      : (task.gradeLevel == 3)
                                          ? globals.standard_color
                                              .withOpacity(0.8)
                                          : (task.gradeLevel == 4)
                                              ? globals.standard_color
                                                  .withOpacity(0.9)
                                              : globals.standard_color
                                                  .withOpacity(1),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
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
    required this.job,
  }) : super(key: key);

  final double w;
  final Task task;
  final String job;

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    if (task.confirmedBy.contains("Ayrton")) counter++;
    if (task.confirmedBy.contains("Leonardo")) counter++;
    if (task.confirmedBy.contains("Lorenzo")) counter++;
    if (task.confirmedBy.contains("Martina")) counter++;
    List<Widget> just_down = [
      SlidableAction(
        onPressed: (context) {
          functions.Review_thumbs_down(task: task, job: job);
        },
        backgroundColor: Colors.orange,
        icon: Icons.thumb_down,
      ),
    ];
    List<Widget> both_actions = [
      SlidableAction(
        onPressed: (context) {
          functions.Review_thumbs_down(task: task, job: job);
        },
        backgroundColor: Colors.orange,
        icon: Icons.thumb_down,
      ),
      SlidableAction(
        onPressed: (context) {
          functions.Review_thumbs_up(task: task, job: job);
        },
        backgroundColor: Colors.green,
        icon: Icons.thumb_up,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                functions.delete_task(task: task, job: job);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: task.confirmedBy.contains(globals.name)
              ? just_down
              : both_actions,
        ),
        child: Card(
          shadowColor: globals.standard_color,
          elevation: 20,
          child: InkWell(
            splashColor: globals.standard_color.withAlpha(30),
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
                                  ? globals.standard_color.withOpacity(0.6)
                                  : (task.gradeLevel == 2)
                                      ? globals.standard_color.withOpacity(0.7)
                                      : (task.gradeLevel == 3)
                                          ? globals.standard_color
                                              .withOpacity(0.8)
                                          : (task.gradeLevel == 4)
                                              ? globals.standard_color
                                                  .withOpacity(0.9)
                                              : globals.standard_color
                                                  .withOpacity(1),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      globals.name == task.completedBy
                          ? Text(
                              "(" + task.date + ")",
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              "(" + task.completedBy + "-" + task.date + ")",
                              style: TextStyle(fontSize: 15),
                            ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 0, 0, 0.0),
                        child: Text(
                          (counter).toString() + "/4",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
    required this.job,
  }) : super(key: key);

  final Task task;
  final double w;
  final String job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                functions.delete_task(task: task, job: job);
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                functions.Completed_to_Review(task: task, job: job);
              },
              backgroundColor: Colors.orange,
              icon: Icons.thumb_down,
            ),
          ],
        ),
        child: Card(
          shadowColor: globals.standard_color,
          elevation: 20,
          child: InkWell(
            splashColor: globals.standard_color.withAlpha(30),
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
                                  ? globals.standard_color.withOpacity(0.6)
                                  : (task.gradeLevel == 2)
                                      ? globals.standard_color.withOpacity(0.7)
                                      : (task.gradeLevel == 3)
                                          ? globals.standard_color
                                              .withOpacity(0.8)
                                          : (task.gradeLevel == 4)
                                              ? globals.standard_color
                                                  .withOpacity(0.9)
                                              : globals.standard_color
                                                  .withOpacity(1),
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      globals.name == task.completedBy
                          ? Text(
                              "(" + task.date + ")",
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              "(" + task.completedBy + "-" + task.date + ")",
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
        ),
      ),
    );
  }
}
