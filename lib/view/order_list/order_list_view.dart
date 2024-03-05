// order_list_view.dart

import 'package:ecom_wave/view/order_list/widget/all_tab_content.dart';
import 'package:ecom_wave/view/order_list/widget/order_tab_widget.dart';
import 'package:flutter/material.dart';


class OrderListView extends StatefulWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {
  final List<String> _tabs = [
    'All',
    'Placed',
    'Confirm',
    'Delivered',
    'Return',
    'Cancel',
  ];

  @override
  Widget build(BuildContext context) {
    return OrderTabLayout(
      tabs: _tabs,
      tabContents: [
        AllTabContent(),
        _buildTabContent('Placed'),
        _buildTabContent('Confirm'),
        _buildTabContent('Delivered'),
        _buildTabContent('Return'),
        _buildTabContent('Cancel'),
      ],
    );
  }

  Widget _buildTabContent(String tabName) {
    // Replace this with the actual content for each tab
    return ListView.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$tabName Item $index'),
        );
      },
    );
  }
}
