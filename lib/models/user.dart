import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/configs/universal_variable.dart';

class UserModel {
  static const ID = "uId";
  static const NAME = "userName";
  static const EMAIL = "email";
  static const STATUS = "status";



  String _id;
  String _name;
  String _email;
  String _status;

//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  String get status => _status;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data()[NAME];
    _email = snapshot.data()[EMAIL];
    _id = snapshot.data()[ID];
    _status = snapshot.data()[STATUS];

  }
}
