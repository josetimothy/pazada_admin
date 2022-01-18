import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/helpers/costants.dart';
import 'package:ecommerce_admin_tut/models/brands.dart';
import 'package:ecommerce_admin_tut/models/driver.dart';

class DriverServices {
  String collection = "PazadaDrivers";

  Future<List<DriverModel>> getAllDriver() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<DriverModel> drivers = [];
        for (DocumentSnapshot driver in result.docs) {
          drivers.add(DriverModel.fromSnapshot(driver));
        }
        return drivers;
      });
}
