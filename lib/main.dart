import 'package:flutter/material.dart';
import 'package:todo_list/Gui/HomePage.dart';
import 'package:todo_list/Gui/OpeningPage.dart';
import 'package:todo_list/Services/3D_Image_Task.dart';
import 'package:todo_list/Services/2D_Image_Task.dart';
import 'package:todo_list/Services/Code_Unity_Task.dart';
import 'package:todo_list/Services/Writing_Task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await User2DImageTask_SheetsAPI.init();
  await User3DImageTask_SheetsAPI.init();
  await UserWritingTask_SheetsAPI.init();
  await UserCodeUnityTask_SheetsAPI.init();
  runApp(MaterialApp(
    title: "To-do project app",
    theme: ThemeData(
      brightness: Brightness.light,
    ),
    onGenerateRoute: (settings) {
      late Widget page;
      if (settings.name == '/') {
        page = OpeningPage();
      } else if (settings.name == '/HomePage') {
        page = Example();
      } else {
        throw Exception('Unkown route:${settings.name}');
      }

      return MaterialPageRoute<dynamic>(
        builder: (context) {
          return page;
        },
        settings: settings,
      );
    },
    debugShowCheckedModeBanner: false,
  ));
}

Future getUser(int id) async {
  final user = await User2DImageTask_SheetsAPI.getById(id);
  print(user!.toJson());
}
