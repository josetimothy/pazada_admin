import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/helpers/costants.dart';
import 'package:ecommerce_admin_tut/models/pazadadriverhistory.dart';
import 'package:ecommerce_admin_tut/models/pazadauserhistory.dart';
import 'package:ecommerce_admin_tut/models/products.dart';

class PazadaDriverHistoryServices {
  String collection = "PazadaDriverHistory";

  Future<List<PazadaDriverHistoryModel>> getAllPazadaDriverHistory() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<PazadaDriverHistoryModel> pazadadriverhistorys = [];
        for (DocumentSnapshot pazadadriverhistory in result.docs) {
          pazadadriverhistorys.add(PazadaDriverHistoryModel.fromSnapshot(pazadadriverhistory));
        }
        return pazadadriverhistorys;
      });
}
