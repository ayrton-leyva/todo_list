import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Services/Task.dart';
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;

class Custom_Card_Todo extends StatefulWidget {
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
  State<Custom_Card_Todo> createState() => _Custom_Card_TodoState();
}

class _Custom_Card_TodoState extends State<Custom_Card_Todo> {
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
                functions.delete_task(task: widget.task, job: widget.job);
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
                functions.ToDo_to_Review(task: widget.task, job: widget.job);
                setState(() {});
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
              width: widget.w * 6 / 7,
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
                              widget.task.gradeLevel.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (widget.task.gradeLevel == 1)
                                  ? globals.standard_color.withOpacity(0.6)
                                  : (widget.task.gradeLevel == 2)
                                      ? globals.standard_color.withOpacity(0.7)
                                      : (widget.task.gradeLevel == 3)
                                          ? globals.standard_color
                                              .withOpacity(0.8)
                                          : (widget.task.gradeLevel == 4)
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
                          widget.task.superTask,
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
                        widget.task.name,
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
                        widget.task.description,
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

class Custom_Card_Review extends StatefulWidget {
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
  State<Custom_Card_Review> createState() => _Custom_Card_ReviewState();
}

class _Custom_Card_ReviewState extends State<Custom_Card_Review> {
  @override
  Widget build(BuildContext context) {
    int counter = 0;
    if (widget.task.confirmedBy.contains("Ayrton")) counter++;
    if (widget.task.confirmedBy.contains("Leonardo")) counter++;
    if (widget.task.confirmedBy.contains("Lorenzo")) counter++;
    if (widget.task.confirmedBy.contains("Martina")) counter++;
    List<Widget> just_down = [
      SlidableAction(
        onPressed: (context) {
          functions.Review_thumbs_down(task: widget.task, job: widget.job);
          setState(() {});
        },
        backgroundColor: Colors.orange,
        icon: Icons.thumb_down,
      ),
    ];
    List<Widget> both_actions = [
      SlidableAction(
        onPressed: (context) {
          functions.Review_thumbs_down(task: widget.task, job: widget.job);
          setState(() {});
        },
        backgroundColor: Colors.orange,
        icon: Icons.thumb_down,
      ),
      SlidableAction(
        onPressed: (context) {
          functions.Review_thumbs_up(task: widget.task, job: widget.job);
          setState(() {});
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
                functions.delete_task(task: widget.task, job: widget.job);
                setState(() {});
              },
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: widget.task.confirmedBy.contains(globals.name)
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
              print(widget.task.completedBy);
            },
            child: SizedBox(
              width: widget.w * 6 / 7,
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
                              widget.task.gradeLevel.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (widget.task.gradeLevel == 1)
                                  ? globals.standard_color.withOpacity(0.6)
                                  : (widget.task.gradeLevel == 2)
                                      ? globals.standard_color.withOpacity(0.7)
                                      : (widget.task.gradeLevel == 3)
                                          ? globals.standard_color
                                              .withOpacity(0.8)
                                          : (widget.task.gradeLevel == 4)
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
                          widget.task.superTask,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      globals.name == widget.task.completedBy
                          ? Text(
                              "(" + widget.task.date + ")",
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              "(" +
                                  widget.task.completedBy +
                                  "-" +
                                  widget.task.date +
                                  ")",
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
                            widget.task.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ),
                        globals.name == widget.task.completedBy
                            ? Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0.0),
                                child: Icon(
                                  LineIcons.check,
                                  size: 12,
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.fromLTRB(15, 0, 0, 0.0),
                                child: Icon(
                                  LineIcons.check,
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
                        widget.task.description,
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

class Custom_Card_Completed extends StatefulWidget {
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
  State<Custom_Card_Completed> createState() => _Custom_Card_CompletedState();
}

class _Custom_Card_CompletedState extends State<Custom_Card_Completed> {
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
                functions.delete_task(task: widget.task, job: widget.job);
                setState(() {});
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
                functions.Completed_to_Review(
                    task: widget.task, job: widget.job);
                setState(() {});
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
              print(widget.task.completedBy);
            },
            child: SizedBox(
              width: widget.w * 6 / 7,
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
                              widget.task.gradeLevel.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (widget.task.gradeLevel == 1)
                                  ? globals.standard_color.withOpacity(0.6)
                                  : (widget.task.gradeLevel == 2)
                                      ? globals.standard_color.withOpacity(0.7)
                                      : (widget.task.gradeLevel == 3)
                                          ? globals.standard_color
                                              .withOpacity(0.8)
                                          : (widget.task.gradeLevel == 4)
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
                          widget.task.superTask,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      globals.name == widget.task.completedBy
                          ? Text(
                              "(" + widget.task.date + ")",
                              style: TextStyle(fontSize: 15),
                            )
                          : Text(
                              "(" +
                                  widget.task.completedBy +
                                  "-" +
                                  widget.task.date +
                                  ")",
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
                            widget.task.name,
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
                        widget.task.description,
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
