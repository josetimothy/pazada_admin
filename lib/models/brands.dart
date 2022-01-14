import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  static const ID = "uId";
  static const BRAND = "sellerName";
  static const NAME = "sellerName";
  static const STATUS = "sellerName";

  String _id;
  String _brand;
  String _name;
  String _status;
//  getters
  String get brand => _brand;
  String get id => _id;
  String get name => _name;
  String get status => _status;

  BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    _brand = snapshot.data()[BRAND];
    _id = snapshot.data()[ID];
    _name = snapshot.data()[NAME];
    _status = snapshot.data()[STATUS];
  }
}
