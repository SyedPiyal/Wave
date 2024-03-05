// order_tab_layout.dart

import 'package:flutter/material.dart';

class OrderTabLayout extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabContents;

  OrderTabLayout({required this.tabs, required this.tabContents});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order List', style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                tabs: tabs.map((String tab) {
                  return Tab(
                    text: tab,
                  );
                }).toList(),
                isScrollable: true, // Make the tab bar scrollable
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: tabContents,
        ),
      ),
    );
  }
}
