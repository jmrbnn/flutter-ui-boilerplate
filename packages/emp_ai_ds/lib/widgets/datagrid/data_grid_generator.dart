// ignore_for_file: library_private_types_in_public_api

// import 'package:dartz/dartz.dart';
import 'package:emp_ai_ds/entities/datatable_column_model.dart';
import 'package:emp_ai_ds/entities/datatable_filter.dart';
import 'package:emp_ai_ds/utils/single_event.dart';
import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:emp_ai_ds/utils/utils.dart';
import 'package:emp_ai_ds/widgets/datagrid/data_grid_pager.dart';
import 'package:emp_ai_ds/widgets/datagrid/pagination_parameters_model.dart';
import 'package:emp_ai_ds/widgets/datagrid/pagination_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
// import 'package:tuple/tuple.dart';

import 'data_grid_source.dart';

// ignore: must_be_immutable
class DataGridGenerator extends StatefulWidget {
  final List<DatatableColumnModel> columns;
  final dynamic useCase;
  final List<DatatableFilter> initialFilters;
  final int freezeLeftColCount;
  final int freezeRightColCount;
  final Function? onGetList;
  final bool hasPager;
  final String? accessToken;

  DataGridGenerator({
    Key? key,
    required this.columns,
    required this.useCase,
    this.initialFilters = const [],
    this.freezeLeftColCount = 0,
    this.freezeRightColCount = 0,
    this.onGetList,
    this.hasPager = true,
    this.accessToken,
  }) : super(key: key);

  @override
  State<DataGridGenerator> createState() => DataGridGeneratorState();

  late SingleEvent<Map> updateDateRange;
  late SingleEvent<Map> resetDateRange;
  late SingleEvent<Map> filterApplied;
}

class DataGridGeneratorState extends State<DataGridGenerator> {
  List list = [];
  RxBool showLoadingIndicator = false.obs;
  RxBool showEmptyIndicator = false.obs;
  double pageCount = 0;
  int rowsPerPage = 10;
  RxInt totalRows = 0.obs;

  var page = 1.obs;
  var size = 0.obs;

  var hasFilters = false.obs;
  var resetInput = false.obs;
  var filters = RxMap({});
  var tempFilters = RxMap({});

  late DataGridDataSource dataSource;

  @override
  void initState() {
    for (var filter in widget.initialFilters) {
      filters.addAll({filter.key: filter.value});
    }

    // invokeUseCase();

    widget.updateDateRange = SingleEvent(invoke: (dates) {
      filterSet(
        'startDate',
        dates!['startDate'],
        autoInvoke: false,
      );
      filterSet(
        'endDate',
        dates['endDate'],
        autoInvoke: false,
      );
      filtersInvoke();
    });

    widget.resetDateRange = SingleEvent(invoke: (_) {
      filterRemove(
        'startDate',
        autoInvoke: false,
      );
      filterRemove(
        'endDate',
        autoInvoke: false,
      );
      filtersInvoke();
    });

    super.initState();
  }

  void initRowsPerPage() {
    rowsPerPage = 10;
  }

  RxInt getCount() {
    return list.length.obs;
  }

  Future invokeUseCase() async {
    initRowsPerPage();
    var list = await _getList();

    dataSource = DataGridDataSource(
      list: list,
      rowsPerPage: rowsPerPage,
      columns: widget.columns,
      useCase: (filters) => invokeUseCase(),
      filters: filters,
      hasFilters: hasFilters,
      filterSet: ((p0, p1, p2) => filterSet(p0, p1, autoInvoke: p2)),
      filtersInvoke: () => filtersInvoke(),
    );

    _updatePages();

    return list;
  }

  Future<List> _getList() async {
    showLoadingIndicator(true);

    var params = PaginationParameters(
      accessToken: widget.accessToken,
      limit: rowsPerPage,
      page: page.value,
      filters: filters,
    );
    await DsUtils.useCaseHandler(
      () => widget.useCase.execute(params),
      onSuccess: (response) async {
        PaginationResponse res = response as PaginationResponse;

        int totalItems = res.count ?? 0;

        if (widget.onGetList != null) {
          widget.onGetList!(totalItems);
        }
        List result = res.items?.toList() ?? [];
        list = result;
        totalRows(totalItems);

        if (totalRows.value == 0) {
          showEmptyIndicator(true);
        } else {
          showEmptyIndicator(false);
        }

        showLoadingIndicator(false);
        return result;
      },
      onError: (e) {
        list = [];
        totalRows(0);
        showLoadingIndicator(false);
        showEmptyIndicator(true);
      },
    );

    return list;
  }

  void _updatePages() {
    if (widget.hasPager) {
      double pages = 1;
      initRowsPerPage();
      if (rowsPerPage > totalRows.value) {
        rowsPerPage = totalRows.value;
      } else {
        pages = (totalRows.value / rowsPerPage).ceilToDouble();
      }

      pageCount = pages > 0 ? pages : 1;
    } else {
      initRowsPerPage();
      rowsPerPage = totalRows.value;
      pageCount = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints(maxHeight: 860),
        child: fetchDataFutureBuilder());
  }

  Widget fetchDataFutureBuilder() {
    return FutureBuilder(
        future: invokeUseCase(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return snapshot.hasData
              ? LayoutBuilder(
                  builder: ((context, constraints) {
                    return SingleChildScrollView(
                      controller: ScrollController(),
                      child: Column(
                        children: [
                          Obx(() => SizedBox(
                                height: list.isNotEmpty
                                    ? list.length < 10
                                        ? list.length * 85 + 90
                                        : 800
                                    : 896,
                                width: constraints.maxWidth,
                                child: _buildStack(constraints),
                              )),
                          SizedBox(
                            height: 60,
                            width: constraints.maxWidth,
                            child: SfDataPagerTheme(
                              data: SfDataPagerThemeData(
                                itemColor: Colors.white,
                                selectedItemColor:
                                    Theme.of(context).primaryColor,
                                itemBorderRadius: BorderRadius.circular(4),
                                itemTextStyle: TypeUtil().body(),
                              ),

                              // child: const SizedBox.shrink(),
                              child: Obx(
                                () => Visibility(
                                  visible: widget.hasPager,
                                  child: DataGridPager(
                                    delegate: dataSource,
                                    pageCount: pageCount,
                                    initialPageIndex: page.value,
                                    direction: Axis.horizontal,
                                    totalItems: totalRows.value.toDouble(),
                                    rowsPerPage: rowsPerPage.toDouble(),
                                    lastPageItemVisible: true,
                                    firstPageItemVisible: true,
                                    onPageNavigationStart: (int pageIndex) {},
                                    onPageNavigationEnd: (int pageIndex) {
                                      if (pageIndex + 1 != page.value) {
                                        setCurrentPage(pageIndex + 1);
                                        fetchDataFutureBuilder();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                )
              : _tableLoader();
        });
  }

  Widget buildDataGrid(BoxConstraints constraint) {
    var horizontalScrollController = ScrollController();
    var frozenPanelElevation = 0.0.obs;
    scrollListener() {
      horizontalScrollController.position.maxScrollExtent == 0 ||
              horizontalScrollController.position.pixels ==
                  horizontalScrollController.position.maxScrollExtent ||
              horizontalScrollController.position.pixels ==
                  horizontalScrollController.position.minScrollExtent
          ? frozenPanelElevation(0.0)
          : frozenPanelElevation(4.0);
    }

    horizontalScrollController.addListener(scrollListener);

    return Obx(() => SfDataGridTheme(
          data: SfDataGridThemeData(
            frozenPaneElevation: frozenPanelElevation.value,
            frozenPaneLineColor:
                DsUtils.color(context, ColorSets.neutral, variant: 50),
            frozenPaneLineWidth: .1,
            gridLineColor: Colors.transparent,
            gridLineStrokeWidth: 0,
            sortIcon: Builder(
              builder: (context) {
                Widget? icon;
                String columnName = '';
                context.visitAncestorElements((element) {
                  if (element is GridHeaderCellElement) {
                    columnName = element.column.columnName;
                  }
                  return true;
                });
                var column = dataSource.sortedColumns
                    .firstWhereOrNull((element) => element.name == columnName);
                if (column != null) {
                  if (column.sortDirection == DataGridSortDirection.ascending) {
                    icon = const Icon(Icons.expand_more);
                  } else if (column.sortDirection ==
                      DataGridSortDirection.descending) {
                    icon = const Icon(Icons.expand_less);
                  }
                }
                return icon ?? const Icon(Icons.sort);
              },
            ),
          ),
          child: SfDataGrid(
            source: dataSource,
            gridLinesVisibility: GridLinesVisibility.none,
            headerGridLinesVisibility: GridLinesVisibility.none,
            showSortNumbers: true,
            rowHeight: 85,
            onQueryRowHeight: (details) {
              return details.rowHeight;
            },
            frozenColumnsCount: widget.freezeLeftColCount,
            footerFrozenColumnsCount: widget.freezeRightColCount,
            isScrollbarAlwaysShown: true,
            horizontalScrollController: horizontalScrollController,
            allowSorting: true,
            columns: _getColumns(),
          ),
        ));
  }

  Widget _buildStack(BoxConstraints constraints) {
    List<Widget> getChildren() {
      final List<Widget> stackChildren = [];
      stackChildren.add(buildDataGrid(constraints));

      if (showLoadingIndicator.value) {
        stackChildren.add(
          _tableLoader(),
        );
      }

      if (showEmptyIndicator.value) {
        stackChildren.add(
          SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Align(
              alignment: Alignment.center,
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // SvgPicture.asset(
                          //   AppIcons.emptyTable,
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          Text(
                            'No records found',
                            style: TypeUtil(
                              weight: FontWeight.w500,
                              color: DsUtils.color(context, ColorSets.neutral,
                                  variant: 80),
                            ).h4(),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            'Try adjusting your search or filter to find what you\'re looking for.',
                            style: TypeUtil(
                              weight: FontWeight.w400,
                              color: DsUtils.color(context, ColorSets.neutral,
                                  variant: 50),
                            ).body(),
                          ),
                        ],
                      ))),
            ),
          ),
        );
      }

      return stackChildren;
    }

    return Stack(
      children: getChildren(),
    );
  }

  Widget _tableLoader() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.white70,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 3,
            ),
          ),
        );
      },
    );
  }

  List<GridColumn> _getColumns() {
    List<GridColumn> gridColumns;
    EdgeInsets headerPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
    );
    gridColumns = (widget.columns.map((DatatableColumnModel e) {
      return GridColumn(
        columnName: e.column ?? '',
        autoFitPadding: headerPadding,
        columnWidthMode: ColumnWidthMode.fill,
        width: e.width ?? double.nan,
        allowSorting: (e.name != '' && e.name != 'Actions'),
        visible: e.isVisible ?? true,
        label: Container(
          // width: Get.width,
          width: e.width ?? double.nan,
          decoration: BoxDecoration(
              border: (e.name == '' || e.name == 'Actions')
                  ? null
                  : Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: DsUtils.color(context, ColorSets.neutral,
                              variant: 30)),
                    )),
          child: Padding(
            padding: headerPadding,
            child: Text(
              e.name == 'Actions' ? '' : e.name ?? '',
              style:
                  TypeUtil(context: context, weight: FontWeight.w700).small(),
            ),
          ),
        ),
      );
    }).toList());
    return gridColumns;
  }

  // Page Navigation
  setCurrentPage(int newPage) {
    page(newPage);
    // filterSet('page', newPage);
    // filtersInvoke();
  }
  //End of Page Navigation

// Filter Methods
  filterSet(field, value, {autoInvoke = true}) {
    if (autoInvoke) {
      filters[field] = value;
      hasFilters(true);
      filtersInvoke();
    } else {
      tempFilters[field] = value;
    }
  }

  int getFilterCount(
      {List excludeFromCount = const [
        'search',
        'transactionRefId',
        'ownerId',
        'walletId',
        'endDate',
        'startDate',
        'channelId',
        'types'
      ]}) {
    Map pseudoFilters = Map.fromEntries(filters.entries
        .where((entry) => !excludeFromCount.contains(entry.key)));

    return pseudoFilters.keys.length;
  }

  filterRemove(field, {autoInvoke = true}) {
    filters.remove(field);
    tempFilters.remove(field);
    if (filters.keys.isEmpty) {
      hasFilters(false);
    }
    if (autoInvoke) filtersInvoke();
  }

  filtersClearTemp() {
    tempFilters({});
  }

  filtersClear() async {
    filters({});
    for (var filter in widget.initialFilters) {
      filters.addAll({filter.key: filter.value});
    }
    hasFilters(false);
    resetInput(true);

    await filtersInvoke();
    resetInput(false);
  }

  filtersClearWithPreserve(
      {List preserveKeys = const [
        'search',
        'transactionRefId',
        'ownerId',
        'walletId',
        'channelId',
        'types',
      ]}) async {
    Map preserveFilters = Map.fromEntries(
        filters.entries.where((entry) => preserveKeys.contains(entry.key)));
    filtersClearTemp();
    filters(preserveFilters);
    for (var filter in widget.initialFilters) {
      filters.addAll({filter.key: filter.value});
    }
    hasFilters(false);
    resetInput(true);

    await filtersInvoke();
    resetInput(false);
  }

  filtersInvoke() {
    if (tempFilters.keys.isNotEmpty) {
      filters.addAll(tempFilters);
    }
    tempFilters.clear();

    if (filters.containsKey('dateRange')) {
      if (filters['dateRange']['selected'] == 'all') {
        filterRemove('dateRange', autoInvoke: false);
        filterRemove('startDate', autoInvoke: false);
        filterRemove('endDate', autoInvoke: false);
      }
    }
    // print('FILTERS-- INVOKE: $filters');
    // print('FILTERS-- CLEANED: ${Utils.cleanMap(filters)}');
    filters(DsUtils.cleanMap(filters));

    invokeUseCase();
  }

  // End of Filter Methods
}
