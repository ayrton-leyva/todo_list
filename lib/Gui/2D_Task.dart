import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_list/Services/Globals.dart' as globals;

class Home_2D extends StatefulWidget {
  const Home_2D({super.key});

  @override
  State<Home_2D> createState() => _Home_2DState();
}

class _Home_2DState extends State<Home_2D> {
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
        title: const Text('2D Tasks'),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Icon(Icons.update),
            ),
            onTap: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Todo_widget(standard_style: standard_style, w: w, h: h),
            To_Review_widget(standard_style: standard_style, w: w, h: h),
            Completed_widget(standard_style: standard_style, w: w, h: h),
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
