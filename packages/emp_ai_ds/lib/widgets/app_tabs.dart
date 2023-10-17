import 'package:emp_ai_ds/utils/type_util.dart';
import 'package:flutter/material.dart';

class AppTabs extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabBarView;
  final int initialIndex;
  final Function(int)? onTabChange;
  const AppTabs({
    Key? key,
    required this.tabs,
    required this.tabBarView,
    this.initialIndex = 0,
    this.onTabChange,
  }) : super(key: key);

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late int _selectedIndex;

  @override
  void initState() {
    _controller = TabController(length: widget.tabs.length, vsync: this);
    setState(() {
      _selectedIndex = widget.initialIndex;
      _controller.index = _selectedIndex;
    });
    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });

      if (widget.onTabChange != null) {
        widget.onTabChange!(_selectedIndex);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      initialIndex: _selectedIndex,
      child: LayoutBuilder(
        builder: ((context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _controller,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor:
                      Theme.of(context).colorScheme.onBackground,
                  labelPadding: const EdgeInsets.only(left: 10, right: 10),
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 3,
                  isScrollable: true,
                  labelStyle:
                      TypeUtil(style: TypeStyle.H5, weight: FontWeight.w700)
                          .make(),
                  tabs: widget.tabs,
                ),
              ),
              Container(
                height: constraints.maxHeight - 50,
                width: constraints.maxWidth,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
                child: TabBarView(
                  controller: _controller,
                  children: widget.tabBarView,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
