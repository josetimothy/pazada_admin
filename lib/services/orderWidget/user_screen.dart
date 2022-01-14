import 'dart:js';

import 'package:ecommerce_admin_tut/helpers/enumerators.dart';
import 'package:ecommerce_admin_tut/pages/transaction/pazabuy_page.dart';
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

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppProvider appProvider = Provider.of<AppProvider>(context);
    return ListView(
      children: [
        PageHeader(text: 'PAZADA USERS',),
        GestureDetector(
          onTap: (){
            appProvider.changeCurrentPage(DisplayedPage.USERSCREEN);
            locator<NavigationService>().navigateTo(PazaheroRoute);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CardItem(
              icon: Icons.monetization_on_outlined,
              title: "PazaHeros",
              subtitle: "Revenue this month",
              // value: "\$ 4,323",
              color1: Colors.green.shade700,
              color2: Colors.green,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            appProvider.changeCurrentPage(DisplayedPage.USERSCREEN);
            locator<NavigationService>().navigateTo(DriverRoute);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CardItem(
              icon: Icons.shopping_basket_outlined,
              title: "Drivers",
              subtitle: "Total products on store",
              // value: "231",
              color1: Colors.lightBlueAccent,
              color2: Colors.blue,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            appProvider.changeCurrentPage(DisplayedPage.BRANDS);
            locator<NavigationService>().navigateTo(BrandsRoute);
          },
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: CardItem(
              icon: Icons.delivery_dining,
              title: "Sellers",
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