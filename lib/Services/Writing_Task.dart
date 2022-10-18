import 'package:flutter/material.dart';
import 'package:todo_list/Services/Globals.dart' as globals;
import 'package:gsheets/gsheets.dart';

class UserWritingTask_SheetsAPI {
  // Credentials
  static const _credentials = globals.credentials;
  // Spreadsheet ID
  static final _spreedsheetID = globals.spreadsheetID_Writing_Task;
  // Sheet
  static final _gsheet = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    final spreadsheet = await _gsheet.spreadsheet(_spreedsheetID);
    _userSheet = await _getWorkSheet(spreadsheet, title: 'Users');
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }
}
