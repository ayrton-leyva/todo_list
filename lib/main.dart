import 'package:flutter/material.dart';
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
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
