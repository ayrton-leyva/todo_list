import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;
import 'package:todo_list/Gui/Custom_cards.dart';

class Home_Unity extends StatefulWidget {
  const Home_Unity({super.key});

  @override
  State<Home_Unity> createState() => _Home_UnityState();
}

class _Home_UnityState extends State<Home_Unity> {
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
        backgroundColor: globals.standard_color,
        title: const Text('Unity Tasks'),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Icon(Icons.update),
            ),
            onTap: () {
              functions.reload_all();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            globals.ToDo_Unity.isEmpty
                ? Column(
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
                      Card(
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
                            child: Center(
                              child: Text('All Tasks are Completed'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Todo_widget(standard_style: standard_style, w: w, h: h),
            SizedBox(height: 10),
            globals.ToReview_Unity.isEmpty
                ? Column(
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
                      Card(
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
                            child: Center(
                              child: Text('Nothing to Review'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : To_Review_widget(standard_style: standard_style, w: w, h: h),
            SizedBox(height: 10),
            globals.Completed_Unity.isEmpty
                ? Column(
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
                      Card(
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
                            child: Center(
                              child: Text('All Tasks are Completed'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Completed_widget(standard_style: standard_style, w: w, h: h),
          ],
        ),
      ),
    );
  }
}

class Todo_widget extends StatefulWidget {
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
  State<Todo_widget> createState() => _Todo_widgetState();
}

class _Todo_widgetState extends State<Todo_widget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            child: Text(
              "To-do List",
              style: widget.standard_style,
            ),
            onTap: () {
              print("works");
            },
          ),
        ),
      ),
    ];
    for (int i = 0; i < globals.ToDo_Unity.length; i++) {
      list.addAll([
        Custom_Card_Todo(
          w: widget.w,
          task: globals.ToDo_Unity[i],
          job: "Unity Task",
        ),
        SizedBox(
          height: 5,
        ),
      ]);
    }
    return Column(children: list);
  }
}

class To_Review_widget extends StatefulWidget {
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
  State<To_Review_widget> createState() => _To_Review_widgetState();
}

class _To_Review_widgetState extends State<To_Review_widget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            child: Text(
              "To-Review List",
              style: widget.standard_style,
            ),
            onTap: () {
              print("works");
            },
          ),
        ),
      ),
    ];
    for (int i = 0; i < globals.ToReview_Unity.length; i++) {
      list.addAll([
        Custom_Card_Review(
          w: widget.w,
          task: globals.ToReview_Unity[i],
          job: "Unity Task",
        ),
        SizedBox(
          height: 5,
        ),
      ]);
    }
    return Column(children: list);
  }
}

class Completed_widget extends StatefulWidget {
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
  State<Completed_widget> createState() => _Completed_widgetState();
}

class _Completed_widgetState extends State<Completed_widget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    list = [
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Align(
          alignment: Alignment.topLeft,
          child: InkWell(
            child: Text(
              "Completed List",
              style: widget.standard_style,
            ),
            onTap: () {
              print("works");
            },
          ),
        ),
      ),
    ];
    for (int i = 0; i < globals.Completed_Unity.length; i++) {
      list.addAll([
        Custom_Card_Completed(
          w: widget.w,
          task: globals.Completed_Unity[i],
          job: "Unity Task",
        ),
        SizedBox(
          height: 5,
        ),
      ]);
    }
    return Column(children: list);
  }
}
