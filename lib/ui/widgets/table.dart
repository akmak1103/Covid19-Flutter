import 'package:flutter/material.dart';
import '../../viewModels/state_model.dart';
import '../../locator.dart';
import '../../viewModels/baseModel.dart';
import '../../models/singleState.dart';

class TableData extends BaseModel {

  StateModel model = locator<StateModel>();

  //boolean flags to maintain ascending and descending status of fields
  bool sortName = true;
  bool sortActive = false;
  bool sortConfirmed = false;
  bool sortDeaths = false;
  bool sortRecovered = false;

  List<Color> colors = [Colors.black,Colors.blue,Colors.purple,Colors.red,Colors.green,Colors.orange];

  columnList(List<StateData> stats) {
    List<String> columnNames = [
      'State/UT',
      'Total',
      'Active',
      'Deaths',
      'Recovered',
      'Last Updated On'
    ];
    List<DataColumn> columns = [];
    for (int idx=0;idx<columnNames.length;idx++){
      columns.add(DataColumn(
        onSort: (idx, bool) {
          _sort(idx, stats);
        },
        label: Text(columnNames[idx],
            style: TextStyle(
              fontSize: 20,
              color: colors[idx],
              fontWeight: FontWeight.w800,
            )),
      ));
    }
    return columns;
  }

  rowList(List<StateData> stats) {
    List<DataRow> rows = [];
    for (var state in stats) {
      rows.add(DataRow(cells: [
        _nameDataCell(state.stateName,colors[0]),
        _dataCell(state.confirmed,colors[1]),
        _dataCell(state.active,colors[2]),
        _dataCell(state.deaths,colors[3]),
        _dataCell(state.recovered,colors[4]),
        _dataCell(state.updatedTime,colors[5])
      ]));
    }
    return rows;
  }

  _sort(index, List<StateData> stats) {
    switch (index) {
      case 0:
        model.sortByName(sortName);
        sortName = !sortName;
        break;
      case 1:
        model.sortByActive(sortActive);
        sortActive = !sortActive;
        break;
      case 2:
        model.sortByConfirmed(sortConfirmed);
        sortConfirmed = !sortConfirmed;
        break;
      case 3:
        model.sortByDeaths(sortDeaths);
        sortDeaths = !sortDeaths;
        break;
      case 4:
        model.sortByRecovered(sortRecovered);
        sortRecovered = !sortRecovered;
        break;
    }
  }

  _nameDataCell(text,color) {
    return DataCell(Container(
      width: 120,
      child: Text(
        text,
        softWrap: true,
        maxLines: 2,
        style: TextStyle(fontWeight: FontWeight.w700,color: color,fontSize: 13),
      ),
    ));
  }

  _dataCell(text,color) {
    return DataCell(Container(
      child: Text(
        text,
        softWrap: true,
        style: TextStyle(fontWeight: FontWeight.w700,color: color,fontSize: 13),
      ),
    ));
  }
}
