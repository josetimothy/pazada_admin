import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  static const ID = "uId";
  static const BRAND = "sellerName";
  static const EMAIL = "sellerEmail";
  static const STATUS = "status";
  static const LOCATION = "location";

  String _id;
  String _brand;
  String _email;
  String _status;
  String _location;
//  getters

  String get brand => _brand;
  String get id => _id;
  String get email => _email;
  String get status => _status;
  String get location => _location;

  BrandModel.fromSnapshot(DocumentSnapshot snapshot) {
    _brand = snapshot.data()[BRAND];
    _id = snapshot.data()[ID];
    _email = snapshot.data()[EMAIL];
    _status = snapshot.data()[STATUS];
    _location = snapshot.data()[LOCATION];
  }
}
