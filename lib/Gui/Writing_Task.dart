import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;

class Home_Writing extends StatefulWidget {
  const Home_Writing({super.key});

  @override
  State<Home_Writing> createState() => _Home_WritingState();
}

class _Home_WritingState extends State<Home_Writing> {
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
        title: const Text('Writing Tasks'),
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
            globals.ToDo_Writing == []
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
            globals.ToReview_Writing == []
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
                : To_Review_widget(standard_style: standard_style, w: w, h: h),
            SizedBox(height: 10),
            globals.Completed_Writing == []
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
                : Completed_widget(standard_style: standard_style, w: w, h: h),
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
        Card(
          shadowColor: Colors.green,
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
        Card(
          shadowColor: Colors.green,
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
                child: Text('Nothing to Review'),
              ),
            ),
          ),
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
        Card(
          shadowColor: Colors.green,
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
                child: Text('Nothing Done yet'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
