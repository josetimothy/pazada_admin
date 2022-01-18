import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/configs/universal_variable.dart';

class DriverModel {
  static const ID = "uId";
  static const NAME = "userName";
  static const USERNUMBER = "userNumber";
  static const STATUS = "status";

  String _id;
  String _name;
  String _usernumber;
  String _status;

//  getters
  String get name => _name;
  String get usernumber => _usernumber;
  String get id => _id;
  String get status => _status;

  DriverModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _usernumber = snapshot.data()[USERNUMBER];
    _id = snapshot.data()[ID];
    _status = snapshot.data()[STATUS];

  }
}
