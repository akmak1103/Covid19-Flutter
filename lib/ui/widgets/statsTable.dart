import 'package:flutter/material.dart';
import '../../locator.dart';
import '../../models/singleState.dart';
import 'table.dart';

class StateWiseStats {

  static statsTable(List<StateData> stats) {
    TableData data = locator<TableData>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
          columnSpacing: 10,
          dataRowHeight: 33,
          dividerThickness: 0,
          headingRowHeight: 30,
          horizontalMargin: 8,
          columns: data.columnList(stats),
          rows: data.rowList(stats)),
    );
  }
}
