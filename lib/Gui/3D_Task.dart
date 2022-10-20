import 'package:flutter/material.dart';
import 'package:todo_list/Gui/Custom_cards.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;
import 'package:todo_list/Services/Task.dart';
import 'package:intl/intl.dart';

class Home_3D extends StatefulWidget {
  const Home_3D({super.key});

  @override
  State<Home_3D> createState() => _Home_3DState();
}

class _Home_3DState extends State<Home_3D> {
  TextStyle clicked_style = TextStyle(color: Colors.cyan);
  TextStyle standard_style = TextStyle(color: Colors.black);
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 20,
        title: const Text('3D Tasks'),
        backgroundColor: globals.standard_color,
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Icon(Icons.update),
            ),
            onTap: () {
              setState(() {
                functions.reload_all();
              });
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                globals.ToDo_3D == []
                    ? Card(
                        shadowColor: globals.standard_color,
                        elevation: 20,
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: SizedBox(
                            width: w * 6 / 7,
                            height: 100,
                            child: Center(
                              child: Text('All Tasks are Completed'),
                            ),
                          ),
                        ),
                      )
                    : Todo_widget(standard_style: standard_style, w: w, h: h),
                SizedBox(height: 10),
                globals.ToReview_3D == []
                    ? Card(
                        shadowColor: globals.standard_color,
                        elevation: 20,
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: SizedBox(
                            width: w * 6 / 7,
                            height: 100,
                            child: Center(
                              child: Text('All Tasks are Completed'),
                            ),
                          ),
                        ),
                      )
                    : To_Review_widget(
                        standard_style: standard_style, w: w, h: h),
                SizedBox(height: 10),
                globals.Completed_3D == []
                    ? Card(
                        shadowColor: globals.standard_color,
                        elevation: 20,
                        child: InkWell(
                          splashColor: Colors.blue.withAlpha(30),
                          onTap: () {
                            debugPrint('Card tapped.');
                          },
                          child: SizedBox(
                            width: w * 6 / 7,
                            height: 100,
                            child: Center(
                              child: Text('All Tasks are Completed'),
                            ),
                          ),
                        ),
                      )
                    : Completed_widget(
                        standard_style: standard_style, w: w, h: h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Todo_widget extends StatelessWidget {
  const Todo_widget({
    Key? key,
    required this.standard_style,
    required this.w,
    required this.h,
  }) : super(key: key);

  final TextStyle standard_style;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    Task fakeData_1 = Task.getData(
        position: 1,
        superTask: "Room 1",
        name: "Chair",
        description: "Sedia nella stanza sporca di sangue",
        state: "TO-DO",
        gradeLevel: 5,
        date: "",
        completedBy: "",
        confirmedBy: "");
    Task fakeData_2 = Task.getData(
        position: 2,
        superTask: "Room 4",
        name: "Table",
        description: "Tavolo nell stanza con cadavere sopra",
        state: "TO-DO",
        gradeLevel: 1,
        date: "",
        completedBy: "",
        confirmedBy: "");
    Task fakeData_3 = Task.getData(
        position: 2,
        superTask: "Room 2",
        name: "Table",
        description: "Tavolo nell stanza con cadavere sopra",
        state: "TO-DO",
        gradeLevel: 3,
        date: "",
        completedBy: "",
        confirmedBy: "");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              child: Text(
                "To-do List",
                style: standard_style,
              ),
              onTap: () {
                print("works");
              },
            ),
          ),
        ),
        Custom_Card_Todo(
          w: w,
          task: fakeData_2,
          job: "3D Task",
        ),
        SizedBox(
          height: 5,
        ),
        Custom_Card_Todo(
          w: w,
          task: fakeData_3,
          job: "3D Task",
        ),
        SizedBox(
          height: 5,
        ),
        Custom_Card_Todo(
          w: w,
          task: fakeData_1,
          job: "3D Task",
        ),
      ],
    );
  }
}

class To_Review_widget extends StatelessWidget {
  const To_Review_widget({
    Key? key,
    required this.standard_style,
    required this.w,
    required this.h,
  }) : super(key: key);

  final TextStyle standard_style;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    Task fakeData_1 = Task.getData(
        position: 1,
        superTask: "Room 1",
        name: "Chair",
        description: "Sedia nella stanza sporca di sangue",
        state: "Review",
        gradeLevel: 5,
        date: DateFormat('EEE d MMM').format(DateTime.now()).toString(),
        completedBy: "Lorenzo",
        confirmedBy: 'Lorenzo,Leonardo');
    Task fakeData_2 = Task.getData(
        position: 2,
        superTask: "Room 4",
        name: "Table",
        description: "Tavolo nell stanza con cadavere sopra",
        state: "Review",
        gradeLevel: 1,
        date: DateFormat('EEE d MMM').format(DateTime.now()).toString(),
        completedBy: "Leonardo",
        confirmedBy: 'Leonardo,Ayrton');
    Task fakeData_3 = Task.getData(
        position: 2,
        superTask: "Room 2",
        name: "Table",
        description: "Tavolo nell stanza con cadavere sopra",
        state: "Review",
        gradeLevel: 3,
        date: DateFormat('EEE d MMM').format(DateTime.now()).toString(),
        completedBy: "Ayrton",
        confirmedBy: 'Ayrton,Lorenzo,Leonardo');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              child: Text(
                "To-Review List",
                style: standard_style,
              ),
              onTap: () {
                print("works");
              },
            ),
          ),
        ),
        Custom_Card_Review(
          w: w,
          task: fakeData_2,
          job: "3D Task",
        ),
        SizedBox(
          height: 5,
        ),
        Custom_Card_Review(
          w: w,
          task: fakeData_3,
          job: "3D Task",
        ),
        SizedBox(
          height: 5,
        ),
        Custom_Card_Review(
          w: w,
          task: fakeData_1,
          job: "3D Task",
        ),
      ],
    );
  }
}

class Completed_widget extends StatelessWidget {
  const Completed_widget({
    Key? key,
    required this.standard_style,
    required this.w,
    required this.h,
  }) : super(key: key);

  final TextStyle standard_style;
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    Task fakeData_1 = Task.getData(
        position: 1,
        superTask: "Room 1",
        name: "Chair",
        description: "Sedia nella stanza sporca di sangue",
        state: "Completed",
        gradeLevel: 5,
        date: DateFormat('EEE d MMM').format(DateTime.now()).toString(),
        completedBy: "Lorenzo",
        confirmedBy: 'Lorenzo,Leonardo');
    Task fakeData_2 = Task.getData(
        position: 2,
        superTask: "Room 4",
        name: "Table",
        description: "Tavolo nell stanza con cadavere sopra",
        state: "Completed",
        gradeLevel: 1,
        date: DateFormat('EEE d MMM').format(DateTime.now()).toString(),
        completedBy: "Leonardo",
        confirmedBy: 'Leonardo,Ayrton');
    Task task = Task.getData(
        position: 2,
        superTask: "Room 2",
        name: "Table",
        description: "Tavolo nell stanza con cadavere sopra",
        state: "Completed",
        gradeLevel: 3,
        date: DateFormat('EEE d MMM').format(DateTime.now()).toString(),
        completedBy: "Ayrton",
        confirmedBy: 'Ayrton,Lorenzo');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              child: Text(
                "Completed List",
                style: standard_style,
              ),
              onTap: () {
                print("works");
              },
            ),
          ),
        ),
        Custom_Card_Completed(
          task: fakeData_2,
          w: w,
          job: "3D Task",
        ),
        SizedBox(
          height: 5,
        ),
        Custom_Card_Completed(
          task: task,
          w: w,
          job: "3D Task",
        ),
        SizedBox(
          height: 5,
        ),
        Custom_Card_Completed(
          task: fakeData_1,
          w: w,
          job: "3D Task",
        ),
      ],
    );
  }
}
