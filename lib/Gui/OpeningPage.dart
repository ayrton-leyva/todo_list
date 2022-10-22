import "package:flutter/material.dart";
import 'package:loading_animations/loading_animations.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Gui/Functions_Globals.dart' as functions;

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  Future<void> setup(context) async {
    functions.reload_all();
    await Future.delayed(Duration(seconds: 4));
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  @override
  Widget build(BuildContext context) {
    setup(context);
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 7, 19, 99),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: LoadingBouncingGrid.square(
          borderColor: globals.standard_color,
          borderSize: 3.0,
          size: 80.0,
          backgroundColor: globals.standard_color,
          duration: Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
// 