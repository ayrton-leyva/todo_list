import '2D_Image_Task.dart';
import '3D_Image_Task.dart';
import 'Writing_Task.dart';
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
  Task.init_3D({
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
  }) {
    position = 0;
    date = "--";
    completedBy = "--";
    confirmedBy = "--";
  }

  Task.init_2D({
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
  }) {
    position = 0;
    date = "--";
    completedBy = "--";
    confirmedBy = "--";
  }

  Task.init_Writing({
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
  }) {
    position = 0;
    date = "--";
    completedBy = "--";
    confirmedBy = "--";
  }

  Task.init_Unity({
    required this.superTask,
    required this.name,
    required this.description,
    required this.state,
    required this.gradeLevel,
  }) {
    position = 0;
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
  Future<int> initPosition_3D() async {
    return await User2DImageTask_SheetsAPI.getRowCount() + 1;
  }

  Future<int> initPosition_2D() async {
    return await User3DImageTask_SheetsAPI.getRowCount() + 1;
  }

  Future<int> initPosition_Writing() async {
    return await UserWritingTask_SheetsAPI.getRowCount() + 1;
  }

  Future<int> initPosition_Unity() async {
    return await UserWritingTask_SheetsAPI.getRowCount() + 1;
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
