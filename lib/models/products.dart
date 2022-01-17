import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {

  static const PRODUCTID = "productID";
  static const MENUNAME = "menuName";
  static const PRICE = "price";
  static const PRODUCTDETAILS = "productDetails";
  static const PRODUCTNAME = "productName";
  static const PUBLISHDATE = "publishedDate";
  static const SELLERNAME = "sellerName";
  static const STATUS = "status";
  static const PIC = "thumbnailUrl";


  String _productID;
  String _menuName;
  int _price;
  String _productDetails;
  Timestamp _publishedDate;
  String _productName;
  String _sellerName;
  String _status;
  String _pic;




  String get productID => _productID;
  String get menuName => _menuName;
  int    get price => _price;
  String get productDetails => _productDetails;
  Timestamp get publishedDate => _publishedDate;
  String get productName => _productName;
  String get sellerName => _sellerName;
  String get status => _status;
  String get pic => _pic;



  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {

    _productID = snapshot.data()[PRODUCTID];
   _menuName = snapshot.data()[MENUNAME];
   _price = int.parse(snapshot.data()[PRICE]);
    _productDetails = snapshot.data()[PRODUCTDETAILS] ?? " ";
   _publishedDate = snapshot.data()[PUBLISHDATE];
   _productName = snapshot.data()[PRODUCTNAME];
   _sellerName = snapshot.data()[SELLERNAME];
   _status = snapshot.data()[STATUS];
   _pic = snapshot.data()[PIC];
  }
}
