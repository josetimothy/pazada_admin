
import 'package:ecommerce_admin_tut/main.dart';
import 'package:ecommerce_admin_tut/pages/brands/brands_page.dart';
import 'package:ecommerce_admin_tut/pages/categories/categories_page.dart';
import 'package:ecommerce_admin_tut/pages/login/login.dart';
import 'package:ecommerce_admin_tut/pages/registration/registration.dart';
import 'package:ecommerce_admin_tut/pages/transaction/seller_history.dart';
import 'package:ecommerce_admin_tut/pages/transaction/pazahero_history.dart';
import 'package:ecommerce_admin_tut/pages/transaction/driver_history.dart';
import 'package:ecommerce_admin_tut/pages/user_info/driver_page.dart';
import 'package:ecommerce_admin_tut/pages/user_info/pazahero_page.dart';
import 'package:ecommerce_admin_tut/services/orderWidget/order_screen.dart';
import 'package:ecommerce_admin_tut/services/orderWidget/user_screen.dart';
import 'package:ecommerce_admin_tut/widgets/layout/layout.dart';

import '../pages/home/home_page.dart';
import '../pages/orders/orders_page.dart';
import '../pages/products/products_page.dart';
import '../pages/users/users_page.dart';
import 'package:ecommerce_admin_tut/rounting/route_names.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomePage());


    // case UsersRoute:
    //   return _getPageRoute(UsersPage());
    case UserScreenRoute:
      return _getPageRoute(UserScreen());// ito yung users  screen
    case DriverRoute:
      return _getPageRoute(DriverPage());// ito driver
    case PazaheroRoute:
      return _getPageRoute(PazaheroPage());// ito user
    case BrandsRoute:
      return _getPageRoute(BrandsPage());//ito sellers
    case ProductsRoute:
      return _getPageRoute(ProductsPage());


    // case OrdersRoute:
    //   return _getPageRoute(OrdersPage());
    case OrdersScreenRoute:
      return _getPageRoute(OrderScreen());//ito yung sa transaction screen
    case SellersHistoryRoute:
      return _getPageRoute(SellerHistoryPage());//ito yung sa transaction
    case DriversHistoryRoute:
      return _getPageRoute(DriversHistoryPage());//ito yung sa transaction
    case PazaheroHistoryRoute:
      return _getPageRoute(PazaheroHistoryPage());//ito yung sa transaction


    case LoginRoute:
      return _getPageRoute(LoginPage());
    case RegistrationRoute:
      return _getPageRoute(RegistrationPage());
          case LayoutRoute:
      return _getPageRoute(LayoutTemplate());
                case CategoriesRoute:
      return _getPageRoute(CategoriesPage());
                case PageControllerRoute:
      return _getPageRoute(AppPagesController());
    default:
      return _getPageRoute(LoginPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}