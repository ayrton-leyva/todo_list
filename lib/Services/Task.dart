import '2D_Image_Task.dart';
import '3D_Image_Task.dart';
import 'Code_Unity_Task.dart';
import 'Writing_Task.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

class SheetField {
  static final String position = "id";
  static final String superTask = "superTask";
  static final String name = "name";
  static final String description = "description";
  static final String state = "state";
  static final String gradeLevel = "gradeLevel";
  static final String date = "date";
  static final String completedBy = "completedBy";
  static final String confirmedBy = "confirmedBy";

  static List<String> getFields() => [
        position,
        superTask,
        name,
        description,
        state,
        gradeLevel,
        date,
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
  late String date;
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
    date = "--";
    completedBy = "--";
    confirmedBy = "--";
  }
  Task.getData({
    required this.position,
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
    required this.date,
    required this.completedBy,
    required this.confirmedBy,
  });

  // Functions
  void initPosition() async {
    position = await User2DImageTask_SheetsAPI.getRowCount() + 1;
  }

  set setDateTIme(DateTime date) {
    this.date = date.toLocal().toString();
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
        SheetField.date: date,
        SheetField.completedBy: completedBy,
        SheetField.confirmedBy: confirmedBy,
      };

  static Task fromJson(Map<String, dynamic> json) => Task.getData(
        position: jsonDecode(json[SheetField.position]),
        superTask: json[SheetField.superTask],
        name: json[SheetField.name],
        description: json[SheetField.description],
        state: json[SheetField.state],
        gradeLevel: jsonDecode(json[SheetField.gradeLevel]),
        date: json[SheetField.date],
        completedBy: json[SheetField.completedBy],
        confirmedBy: json[SheetField.confirmedBy],
      );
}
