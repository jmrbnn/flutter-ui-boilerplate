// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:emp_ai_ds/entities/datatable_column_model.dart';
import 'package:emp_ai_ds/utils/color_utils.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

typedef DynamicCallback = void Function(Map);
typedef FilterCallback = void Function(String, String, bool?);

class DataGridDataSource extends DataGridSource {
  int rowsPerPage;
  List<dynamic> list;
  DynamicCallback? useCase;
  RxMap filters;
  RxBool hasFilters;
  FilterCallback filterSet;
  VoidCallback filtersInvoke;

  final List<DatatableColumnModel> columns;
  DataGridDataSource({
    this.list = const [],
    this.rowsPerPage = 3,
    this.useCase,
    required this.columns,
    required this.filters,
    required this.hasFilters,
    required this.filterSet,
    required this.filtersInvoke,
  }) {
    buildDataGridRows();
    if (filters.keys.contains('order_by') && filters.keys.contains('order')) {
      if (filters['order_by'] != '_id') {
        sortedColumns.add(SortColumnDetails(
          name: filters['order_by'],
          sortDirection: filters['order'] == 'asc'
              ? DataGridSortDirection.ascending
              : DataGridSortDirection.descending,
        ));
      }
    }
  }

  List<DataGridRow> dataGridRows = [];
  Map params = {};
  Rx<String> sortKey = ''.obs;

  void buildDataGridRows() {
    dataGridRows = list.map<DataGridRow>((dataGridRow) {
      return DataGridRow(
        cells: columns
            .map(
              (DatatableColumnModel e) => DataGridCell(
                columnName: e.column ?? '',
                value: {
                  'val': dataGridRow[e.column],
                  'obj': e,
                  'data': dataGridRow,
                },
              ),
            )
            .toList(),
      );
    }).toList(growable: false);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  Future<void> sort() async {
    String sortDirection =
        sortedColumns.first.sortDirection == DataGridSortDirection.ascending
            ? 'asc'
            : 'desc';
    sortKey(sortedColumns.first.name);
    filterSet('order_by', sortedColumns.first.name, false);
    filterSet('order', sortDirection, false);
    filtersInvoke();
    super.sort();
  }

  @override
  int compare(DataGridRow? a, DataGridRow? b, SortColumnDetails sortColumn) {
    var aDetails = a!.getCells().firstWhere((element) => true);

    var _a = DataGridRow(cells: [
      DataGridCell(
        columnName: aDetails.columnName,
        value: aDetails.value['val'],
      )
    ]);
    var bDetails = b!.getCells().firstWhere((element) => true);

    var _b = DataGridRow(cells: [
      DataGridCell(
        columnName: bDetails.columnName,
        value: bDetails.value['val'],
      )
    ]);

    return super.compare(_a, _b, sortColumn);
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1.0, color: AppColors.neutral.shade50),
        )),
        child: Padding(
          padding: e.value['obj'].name == 'Actions'
              ? EdgeInsets.zero
              : const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
          child: LayoutBuilder(
            builder: ((context, constraints) {
              return e.value['obj'].builder != null
                  ? e.value['obj'].builder(e.value['data'])
                  : Text(
                      e.value['val'].toString(),
                      style: TypeUtil(context: context).small(),
                    );
            }),
          ),
        ),
      );
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    // await Future.delayed(const Duration(seconds: 1));
    int startIndex = newPageIndex * rowsPerPage;
    int endIndex = startIndex + rowsPerPage;

    // useCase!(params);

    if (startIndex < list.length) {
      if (endIndex > list.length) {
        endIndex = list.length;
      }
      list = list.getRange(startIndex, endIndex).toList(growable: false);

      buildDataGridRows();
    } else {
      list = [];
    }
    notifyListeners();
    return true;
  }
}
