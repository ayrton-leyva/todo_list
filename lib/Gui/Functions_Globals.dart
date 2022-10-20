import 'dart:convert';
import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:todo_list/Services/Task.dart';
import 'package:todo_list/Services/3D_Image_Task.dart';
import 'package:todo_list/Services/2D_Image_Task.dart';
import 'package:todo_list/Services/Code_Unity_Task.dart';
import 'package:todo_list/Services/Writing_Task.dart';

void reload_all() async {
  // List 2D Tasks
  var list_2D = await User2DImageTask_SheetsAPI.getAll();

  for (int i = 0; i < list_2D.length; i++) {
    if (list_2D[i].state == "TO-DO") {
      globals.ToDo_2D.add(list_2D[i]);
    } else if (list_2D[i].state == "TO-REVIEW") {
      globals.ToReview_2D.add(list_2D[i]);
    } else {
      globals.Completed_2D.add(list_2D[i]);
    }
  }

  // List 3D Tasks
  var list_3D = await User3DImageTask_SheetsAPI.getAll();

  for (int i = 0; i < list_3D.length; i++) {
    if (list_3D[i].state == "TO-DO") {
      globals.ToDo_3D.add(list_3D[i]);
    } else if (list_3D[i].state == "TO-REVIEW") {
      globals.ToReview_3D.add(list_3D[i]);
    } else {
      globals.Completed_3D.add(list_3D[i]);
    }
  }

  // List Writing Tasks
  var list_Writing = await UserWritingTask_SheetsAPI.getAll();

  for (int i = 0; i < list_Writing.length; i++) {
    if (list_Writing[i].state == "TO-DO") {
      globals.ToDo_Writing.add(list_Writing[i]);
    } else if (list_Writing[i].state == "TO-REVIEW") {
      globals.ToReview_Writing.add(list_Writing[i]);
    } else {
      globals.Completed_Writing.add(list_Writing[i]);
    }
  }

  // List Unity Tasks
  var list_Unity = await UserCodeUnityTask_SheetsAPI.getAll();

  for (int i = 0; i < list_Unity.length; i++) {
    if (list_Unity[i].state == "TO-DO") {
      globals.ToDo_Unity.add(list_Unity[i]);
    } else if (list_Unity[i].state == "TO-REVIEW") {
      globals.ToReview_Unity.add(list_Unity[i]);
    } else {
      globals.Completed_Unity.add(list_Unity[i]);
    }
  }

  // Sorting 2D
  globals.ToDo_2D.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.ToReview_2D.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.Completed_2D.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  // Sorting 3D
  globals.ToDo_3D.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.ToReview_2D.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.Completed_3D.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  // Sorting Writing
  globals.ToDo_Writing.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.ToReview_Writing.sort(
      ((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.Completed_Writing.sort(
      ((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  // Sorting Unity
  globals.ToDo_Unity.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.ToReview_Unity.sort(((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  globals.Completed_Unity.sort(
      ((a, b) => a.gradeLevel.compareTo(b.gradeLevel)));
  print("Reaload Full");
  // await User2DImageTask_SheetsAPI.insert([fakeData_1.toJson()]);
  // await User2DImageTask_SheetsAPI.insert([fakeData_2.toJson()]);
  // await User2DImageTask_SheetsAPI.insert([fakeData_3.toJson()]);
  // print(await User2DImageTask_SheetsAPI.getRowCount());
  // await User2DImageTask_SheetsAPI.deleteById(2);
}

void delete_task(Task task, String job) async {
  // eliminate from globals
  switch (job) {
    case "3D Task":
      await User3DImageTask_SheetsAPI.deleteById(task.position);
      switch (task.state) {
        case "TO-DO":
          final index = globals.ToDo_3D.indexOf(task);
          globals.ToDo_3D.removeAt(index);
          break;
        case "Review":
          final index = globals.ToReview_3D.indexOf(task);
          globals.ToReview_3D.removeAt(index);
          break;
        case "Completed":
          final index = globals.Completed_3D.indexOf(task);
          globals.Completed_3D.removeAt(index);
          break;
      }
      break;
    case "2D Task":
      await User2DImageTask_SheetsAPI.deleteById(task.position);
      switch (task.state) {
        case "TO-DO":
          final index = globals.ToDo_2D.indexOf(task);
          globals.ToDo_2D.removeAt(index);
          break;
        case "Review":
          final index = globals.ToReview_2D.indexOf(task);
          globals.ToReview_2D.removeAt(index);
          break;
        case "Completed":
          final index = globals.Completed_2D.indexOf(task);
          globals.Completed_2D.removeAt(index);
          break;
      }
      break;
    case "Writing Task":
      await UserWritingTask_SheetsAPI.deleteById(task.position);
      switch (task.state) {
        case "TO-DO":
          final index = globals.ToDo_Writing.indexOf(task);
          globals.ToDo_Writing.removeAt(index);
          break;
        case "Review":
          final index = globals.ToReview_Writing.indexOf(task);
          globals.ToReview_Writing.removeAt(index);
          break;
        case "Completed":
          final index = globals.Completed_Writing.indexOf(task);
          globals.Completed_Writing.removeAt(index);
          break;
      }
      break;
    case "Unity Task":
      await UserCodeUnityTask_SheetsAPI.deleteById(task.position);
      switch (task.state) {
        case "TO-DO":
          final index = globals.ToDo_Unity.indexOf(task);
          globals.ToDo_Unity.removeAt(index);
          break;
        case "Review":
          final index = globals.ToReview_Unity.indexOf(task);
          globals.ToReview_Unity.removeAt(index);
          break;
        case "Completed":
          final index = globals.Completed_Unity.indexOf(task);
          globals.Completed_Unity.removeAt(index);
          break;
      }
      break;
  }
}
