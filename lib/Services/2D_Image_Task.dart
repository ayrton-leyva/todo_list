import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:gsheets/gsheets.dart';
import 'package:todo_list/Services/Task.dart';

class User2DImageTask_SheetsAPI {
  // Credentials
  static const _credentials = globals.credentials;
  // Spreadsheet ID
  static final _spreedsheetID = globals.spreadsheetID_2D_Image_Task;
  // Sheet
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheet.spreadsheet(_spreedsheetID);
      _userSheet = await _getWorkSheet(
        spreadsheet,
        title: 'User',
      );
    } catch (e) {
      print("Initialize Error 2D $e");
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (rowList.isEmpty || _userSheet == null) return;

    print(rowList);
    _userSheet!.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastRow = await _userSheet!.values.lastRow();
    return lastRow!.first == "id" ? 0 : int.parse(lastRow.first);
  }

  static Future<Task?> getById(int id) async {
    if (_userSheet == null) return null;
    final json = await _userSheet!.values.map.rowByKey(
      id,
      fromColumn: 1,
    );
    return json == null ? null : Task.fromJson(json);
  }

  static Future<List<Task>> getAll() async {
    if (_userSheet == null) return <Task>[];
    final tasks = await _userSheet!.values.map.allRows();
    return tasks == null ? [] : tasks.map((e) => Task.fromJson(e)).toList();
  }

  static Future<bool> updateAll(
    int id,
    Map<String, dynamic> task,
  ) async {
    if (_userSheet == null) return false;
    return _userSheet!.values.map.insertRowByKey(
      id,
      task,
    );
  }

  static Future<bool> updateCell({
    required int row,
    required String col,
    required dynamic value,
  }) async {
    if (_userSheet == null) return false;

    return _userSheet!.values.insertValueByKeys(
      value,
      columnKey: col,
      rowKey: row,
    );
  }

  static Future<bool> deleteById(int id) async {
    if (_userSheet == null) return false;

    final index = await _userSheet!.values.rowIndexOf(id);
    if (index == -1) return false;
    return _userSheet!.deleteRow(index);
  }

  static Future<bool> updateId() async {
    if (_userSheet == null) return false;
    List<bool> check = [];
    final totalRowNumber = await User2DImageTask_SheetsAPI.getRowCount();
    print(totalRowNumber);
    for (int i = 1; i <= totalRowNumber; i++) {
      check.add(await User2DImageTask_SheetsAPI.updateCell(
        row: i,
        col: "id",
        value: i,
      ));
    }
    for (int i = 0; i < check.length; i++) {
      if (!check[i]) return false;
    }
    return true;
  }
}
