import 'dart:js';

import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/pages/transaction/pazahero_history.dart';
import 'package:ecommerce_admin_tut/pages/transaction/seller_history.dart';
import 'package:ecommerce_admin_tut/provider/app_provider.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:ecommerce_admin_tut/widgets/cards/card_item.dart';
import 'package:ecommerce_admin_tut/widgets/custom_text.dart';
import 'package:ecommerce_admin_tut/widgets/page_header.dart';
import 'package:ecommerce_admin_tut/widgets/charts/sales_chart.dart';
import 'package:ecommerce_admin_tut/widgets/top_buyer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../navigation_service.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return ListView(
      children: [
        PageHeader(text: 'TRANSACTION HISTORY',),
        GestureDetector(
          onTap: (){
            appProvider.changeCurrentPage(DisplayedPage.ORDERSCREEN);
            locator<NavigationService>().navigateTo(PazaheroHistoryRoute);
            },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CardItem(
              icon: Icons.monetization_on_outlined,
              title: "Pazahero Transaction History",
              subtitle: "Revenue this month",
              // value: "\$ 4,323",
              color1: Colors.green.shade700,
              color2: Colors.green,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            appProvider.changeCurrentPage(DisplayedPage.ORDERSCREEN);
            locator<NavigationService>().navigateTo(DriverHistoryRoute);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CardItem(
              icon: Icons.shopping_basket_outlined,
              title: "Pazada Driver Transaction History",
              subtitle: "Total orders for this month",
              // value: "231",
              color1: Colors.lightBlueAccent,
              color2: Colors.blue,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            appProvider.changeCurrentPage(DisplayedPage.ORDERSCREEN);
            locator<NavigationService>().navigateTo(SellerHistoryRoute);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CardItem(
              icon: Icons.delivery_dining,
              title: "Pazada Seller Transaction History",
              subtitle: "Total orders for this month",
              // value: "33",
              color1: Colors.redAccent,
              color2: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}