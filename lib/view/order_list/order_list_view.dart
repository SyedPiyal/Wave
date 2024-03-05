import 'package:ecom_wave/view/order_list/widget/all_tab_content.dart';
import 'package:ecom_wave/view/order_list/widget/cancle_tab_content.dart';
import 'package:ecom_wave/view/order_list/widget/confirm_tab_content.dart';
import 'package:ecom_wave/view/order_list/widget/delivery_tab_content.dart';
import 'package:ecom_wave/view/order_list/widget/order_tab_widget.dart';
import 'package:ecom_wave/view/order_list/widget/placed_tab_content.dart';
import 'package:ecom_wave/view/order_list/widget/return_tab_content.dart';
import 'package:flutter/material.dart';


class OrderListView extends StatefulWidget {
  const OrderListView({Key? key}) : super(key: key);

  @override
  State<OrderListView> createState() => _OrderListViewState();
}

class _OrderListViewState extends State<OrderListView> {


  //==============================
  // List name for the tab
  //==============================

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

      //==============================
      // custom tab widget
      //==============================

      tabs: _tabs,
      tabContents: [
        AllTabContent(),
        PlacedTabContent(),
        ConfirmTabContent(),
        DeliveryTabContent(),
        ReturnTabContent(),
        CancleTabContent(),
      ],
    );
  }

  Widget _buildTabContent(String tabName) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('$tabName Item $index'),
        );
      },
    );
  }
}
