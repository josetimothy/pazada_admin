import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/helpers/costants.dart';
import 'package:ecommerce_admin_tut/models/pazadasellerhistory.dart';
import 'package:ecommerce_admin_tut/models/pazadauserhistory.dart';
import 'package:ecommerce_admin_tut/models/products.dart';

class PazadaSellerHistoryServices {
  String collection = "PazadaSellerHistory";

  Future<List<PazadaSellerHistoryModel>> getAllPazadaSellerHistory() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<PazadaSellerHistoryModel> pazadasellerhistorys = [];
        for (DocumentSnapshot pazadasellerhistory in result.docs) {
          pazadasellerhistorys.add(PazadaSellerHistoryModel.fromSnapshot(pazadasellerhistory));
        }
        return pazadasellerhistorys;
      });
}
