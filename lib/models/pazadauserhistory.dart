import 'package:cloud_firestore/cloud_firestore.dart';

class PazadaUserHistoryModel {

  static const PAZADAHISTORYID = "pazadaHistoryID";
  static const SERVICE_TYPE = "service_type";
  static const PRICE = "price";
  static const DESTINATION_ADDRESS = "destination_address";
  static const DRIVERNAME = "driver_name";
  static const CREATED_AT = "created_at";
  static const DRIVER_PHONE = "driver_phone";
  static const PASSENGER_NAME = "passenger_name";
  static const PASSENGER_PHONE = "passenger_phone";
  static const PICKUP_ADDRESS = "pickup_address";
  static const GRANDTOTAL = "Grand_Total";


  String _pazadaHistoryID;
  String _service_type;
  int _price;
  String _destination_address;
  Timestamp _created_at;
  String _driver_name;
  String _driver_phone;
  String _passenger_name;
  String _passenger_phone;
  String _pickup_address;
  String _Grand_Total;



  String get pazadaHistoryID => _pazadaHistoryID;
  String get service_type => _service_type;
  int    get price => _price;
  String get destination_address => _destination_address;
  Timestamp get created_at => _created_at;
  String get driver_name => _driver_name;
  String get driver_phone => _driver_phone;
  String get passenger_name => _passenger_name;
  String get passenger_phone => _passenger_phone;
  String get pickup_address => _pickup_address;
 String  get Grand_Total =>  _Grand_Total;



  PazadaUserHistoryModel.fromSnapshot(DocumentSnapshot snapshot) {

    _pazadaHistoryID = snapshot.data()[PAZADAHISTORYID];
    _service_type = snapshot.data()[SERVICE_TYPE];
    _price = int.parse(snapshot.data()[PRICE]);
    _destination_address = snapshot.data()[DESTINATION_ADDRESS] ?? " ";
    _created_at = snapshot.data()[CREATED_AT];
    _driver_name = snapshot.data()[DRIVERNAME];
    _driver_phone = snapshot.data()[DRIVER_PHONE];
    _passenger_name = snapshot.data()[PASSENGER_NAME];
    _passenger_phone = snapshot.data()[PASSENGER_PHONE];
    _pickup_address = snapshot.data()[PICKUP_ADDRESS];
    _Grand_Total = snapshot.data()[GRANDTOTAL];
  }
}
