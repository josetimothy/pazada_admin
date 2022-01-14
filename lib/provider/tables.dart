import 'dart:math';

import 'package:ecommerce_admin_tut/models/brands.dart';
import 'package:ecommerce_admin_tut/models/categories.dart';
import 'package:ecommerce_admin_tut/models/driver.dart';
import 'package:ecommerce_admin_tut/models/orders.dart';
import 'package:ecommerce_admin_tut/models/products.dart';
import 'package:ecommerce_admin_tut/models/user.dart';
import 'package:ecommerce_admin_tut/services/brands.dart';
import 'package:ecommerce_admin_tut/services/categories.dart';
import 'package:ecommerce_admin_tut/services/driver.dart';
import 'package:ecommerce_admin_tut/services/orders.dart';
import 'package:ecommerce_admin_tut/services/products.dart';
import 'package:ecommerce_admin_tut/services/user.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_table/DatatableHeader.dart';

class TablesProvider with ChangeNotifier {
  // ANCHOR table headers
  List<DatatableHeader> usersTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Email",
        value: "email",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];
  List<DatatableHeader> driverTableHeader = [//drivers
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Name",
        value: "name",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Email",
        value: "email",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<DatatableHeader> ordersTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: false,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "User Id",
        value: "userId",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Description",
        value: "description",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Created At",
        value: "createdAt",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Total",
        value: "total",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<DatatableHeader> productsTableHeader = [
    DatatableHeader(
        text: "Product ID",
        value: "productID",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Product Name",
        value: "productName",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Price",
        value: "price",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Product Details",
        value: "productDetails",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Published Date",
        value: "publishedDate",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Seller Name",
        value: "sellerName",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Menu Name",
        value: "menuName",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Status",
        value: "status",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
    DatatableHeader(
        text: "Picture",
        value: "pic",
        show: true,
        sortable: true,
        textAlign: TextAlign.center),
  ];

  List<DatatableHeader> brandsTableHeader = [//seller
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Brand",
        value: "brand",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
  ];

  List<DatatableHeader> categoriesTableHeader = [
    DatatableHeader(
        text: "ID",
        value: "id",
        show: true,
        sortable: true,
        textAlign: TextAlign.left),
    DatatableHeader(
        text: "Category",
        value: "category",
        show: true,
        flex: 2,
        sortable: true,
        textAlign: TextAlign.left),
  ];
  List<int> perPages = [5, 10, 15, 100];
  int total = 100;
  int currentPerPage;
  int currentPage = 1;
  bool isSearch = false;

  List<Map<String, dynamic>> usersTableSource = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> driverTableSource = List<Map<String, dynamic>>();//drivers
  List<Map<String, dynamic>> brandsTableSource = List<Map<String, dynamic>>();//seller
  List<Map<String, dynamic>> ordersTableSource = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> pazakayTableSource = List<Map<String, dynamic>>();//pazakay
  List<Map<String, dynamic>> pazabuyTableSource = List<Map<String, dynamic>>();//pazabuy
  List<Map<String, dynamic>> pazshipTableSource = List<Map<String, dynamic>>();//pazship
  List<Map<String, dynamic>> productsTableSource = List<Map<String, dynamic>>();
  List<Map<String, dynamic>> categoriesTableSource = List<Map<String, dynamic>>();


  List<Map<String, dynamic>> selecteds = List<Map<String, dynamic>>();
  String selectableKey = "id";

  String sortColumn;
  bool sortAscending = true;
  bool isLoading = true;
  bool showSelect = true;

  UserServices _userServices = UserServices();
  List<UserModel> _users = <UserModel>[];
  List<UserModel> get users => _users;

  DriverServices _driverServices = DriverServices();//driver
  List<DriverModel> _driver = <DriverModel>[];
  List<DriverModel> get driver => _driver;

  OrderServices _orderServices = OrderServices();
  List<OrderModel> _orders = <OrderModel>[];
  List<OrderModel> get orders => _orders;

  ProductsServices _productsServices = ProductsServices();
  List<ProductModel> _products = <ProductModel>[];
  List<ProductModel> get products => _products;

  CategoriesServices _categoriesServices = CategoriesServices();
  List<CategoriesModel> _categories = <CategoriesModel>[];

  BrandsServices _brandsServices = BrandsServices();
  List<BrandModel> _brands = <BrandModel>[];

  Future _loadFromFirebase() async {
    _users = await _userServices.getAllUsers();
    _driver = await _driverServices.getAllDriver();//driver
    _orders = await _orderServices.getAllOrders();
    _products = await _productsServices.getAllProducts();
    _brands = await _brandsServices.getAll();
    _categories = await _categoriesServices.getAll();
  }

  List<Map<String, dynamic>> _getUsersData() {
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _users.length;
    print(i);
    for (UserModel userData in _users) {
      temps.add({
        "id": userData.id,
        "email": userData.email,
        "name": userData.name,
      });
      i++;
    }
    isLoading = false;
    notifyListeners();
    return temps;
  }

  List<Map<String, dynamic>> _getDriverData() { //driver
    isLoading = true;
    notifyListeners();
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    var i = _driver.length;
    print(i);
    for (DriverModel driverData in _driver) {
      temps.add({
        "id": driverData.id,
        "email": driverData.email,
        "name": driverData.name,
      });
      i++;
    }
    isLoading = false;
    notifyListeners();
    return temps;
  }

  List<Map<String, dynamic>> _getBrandsData() {
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    for (BrandModel brand in _brands) {
      temps.add({
        "id": brand.id,
        "brand": brand.brand,
      });
    }
    return temps;
  }

  List<Map<String, dynamic>> _getCategoriesData() {
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();

    for (CategoriesModel category in _categories) {
      temps.add({
        "id": category.id,
        "category": category.category,
      });
    }
    return temps;
  }

  List<Map<String, dynamic>> _getOrdersData() {
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    for (OrderModel order in _orders) {
      temps.add({
        "id": order.id,
        "userId": order.userId,
        "description": order.description,
        "createdAt": DateFormat.yMMMd()
            .format(DateTime.fromMillisecondsSinceEpoch(order.createdAt)),
        "total": "\$${order.total}",
      });
    }
    return temps;
  }

  List<Map<String, dynamic>> _getProductsData() {
    List<Map<String, dynamic>> temps = List<Map<String, dynamic>>();
    for (ProductModel product in _products) {
      temps.add({

      "menuName": product.menuName,
      "price": product.price,
      "productDetails": product.productDetails,
      "productID": product.productID,
      "publishedDate": product.publishedDate.toDate(),
      "productName": product.productName,
      "sellerName": product.sellerName,
      "status": product.status,
      "pic": product.pic,
      });
    }
    return temps;
  }

  _initData() async {
    isLoading = true;
    notifyListeners();
    await _loadFromFirebase();
    usersTableSource.addAll(_getUsersData());
    driverTableSource.addAll(_getDriverData());
    ordersTableSource.addAll(_getOrdersData());
    productsTableSource.addAll(_getProductsData());
    categoriesTableSource.addAll(_getCategoriesData());
    brandsTableSource.addAll(_getBrandsData());

    isLoading = false;
    notifyListeners();
  }

  onSort(dynamic value) {
    sortColumn = value;
    sortAscending = !sortAscending;
    if (sortAscending) {
      driverTableSource
          .sort((a, b) => b["$sortColumn"].compareTo(a["$sortColumn"]));
    } else {
      driverTableSource
          .sort((a, b) => a["$sortColumn"].compareTo(b["$sortColumn"]));
    }
    notifyListeners();
  }

  onSelected(bool value, Map<String, dynamic> item) {
    print("$value  $item ");
    if (value) {
      selecteds.add(item);

    } else {
      selecteds.removeAt(selecteds.indexOf(item));
    }
    notifyListeners();
  }
  onSelectAll(bool value) {
    if (value) {
      selecteds = pazshipTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }

  onSelectAlluser(bool value) {
    if (value) {
      selecteds = usersTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAlldriver(bool value) {
    if (value) {
      selecteds = driverTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAllseller(bool value) {
    if (value) {
      selecteds = brandsTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAllpazakay(bool value) {
    if (value) {
      selecteds = pazakayTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAllpazabuy(bool value) {
    if (value) {
      selecteds = pazabuyTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAllpazship(bool value) {
    if (value) {
      selecteds = pazshipTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAllproduct(bool value) {
    if (value) {
      selecteds = productsTableSource.map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }
  onSelectAllcat(bool value) {
    if (value) {
      selecteds = categoriesTableSource  .map((entry) => entry).toList().cast();
    } else {
      selecteds.clear();
    }
    notifyListeners();
  }

  onChanged(int value) {
    currentPerPage = value;
    notifyListeners();
  }

  previous() {
    currentPage = currentPage >= 2 ? currentPage - 1 : 1;
    notifyListeners();
  }

  next() {
    currentPage++;
    notifyListeners();
  }

  TablesProvider.init() {
    _initData();
  }
}
