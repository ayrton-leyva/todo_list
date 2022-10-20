import '2D_Image_Task.dart';
import '3D_Image_Task.dart';
import 'Code_Unity_Task.dart';
import 'Writing_Task.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class SheetField {
  static final String position = "";
  static final String superTask = "";
  static final String name = "";
  static final String description = "";
  static final String state = "";
  static final String gradeLevel = "";
  static final String dateTime = "";
  static final String completedBy = "";
  static final String confirmedBy = "";

  static List<String> getFields() => [
        position,
        superTask,
        name,
        description,
        state,
        gradeLevel,
        dateTime,
        completedBy,
        confirmedBy,
      ];
}

// Solo per creare dei dati
class Task {
  // positional
  late int position;
  // Initialize
  final String superTask;
  String name;
  String description;
  String state;
  int gradeLevel;
  // late variables
  late String dateTime;
  late String completedBy;
  late String confirmedBy;
  // Constructors
  Task.init({
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
  }) {
    initPosition();
    dateTime = "";
    completedBy = "";
    confirmedBy = "";
  }
  Task.getData({
    required this.position,
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
    required this.dateTime,
    required this.completedBy,
    required this.confirmedBy,
  });

  // Functions
  void initPosition() async {
    position = await User2DImageTask_SheetsAPI.getRowCount() + 1;
  }

  set setDateTIme(DateTime date) {
    dateTime = date.toLocal().toString();
  }

  set setCompletedBy(String name) {
    completedBy = name;
  }

  set setConfirmedBy(String list) {
    confirmedBy = list;
  }

  Map<String, dynamic> toJson() => {
        SheetField.position: position,
        SheetField.superTask: superTask,
        SheetField.name: name,
        SheetField.description: description,
        SheetField.state: state,
        SheetField.gradeLevel: gradeLevel,
        SheetField.dateTime: dateTime,
        SheetField.completedBy: completedBy,
        SheetField.confirmedBy: confirmedBy,
      };

  static Task fromJson(Map<String, dynamic> json) => Task.getData(
        position: jsonDecode(json[SheetField.position]),
        superTask: json[SheetField.superTask],
        name: json[SheetField.superTask],
        description: json[SheetField.superTask],
        state: json[SheetField.superTask],
        gradeLevel: jsonDecode(json[SheetField.superTask]),
        dateTime: json[SheetField.dateTime],
        completedBy: json[SheetField.completedBy],
        confirmedBy: json[SheetField.confirmedBy],
      );
}
