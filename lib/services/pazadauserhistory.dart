import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/helpers/costants.dart';
import 'package:ecommerce_admin_tut/models/pazadauserhistory.dart';
import 'package:ecommerce_admin_tut/models/products.dart';

class PazadaUserHistoryServices {
  String collection = "PazadaUserHistory";

  Future<List<PazadaUserHistoryModel>> getAllPazadaUserHistory() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<PazadaUserHistoryModel> pazadauserhistorys = [];
        for (DocumentSnapshot pazadauserhistory in result.docs) {
          pazadauserhistorys.add(PazadaUserHistoryModel.fromSnapshot(pazadauserhistory));
        }
        return pazadauserhistorys;
      });
}
