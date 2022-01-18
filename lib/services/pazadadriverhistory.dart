import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_admin_tut/helpers/costants.dart';
import 'package:ecommerce_admin_tut/models/pazadadrivershistory.dart';

class PazadaDriversHistoryServices {
  String collection = "PazadaDriverHistory";

  Future<List<PazadaDriversHistoryModel>> getAllPazadaDriversHistory() async =>
      firebaseFiretore.collection(collection).get().then((result) {
        List<PazadaDriversHistoryModel> pazadadrivershistorys = [];
        for (DocumentSnapshot pazadadriverhistory in result.docs) {
          pazadadrivershistorys.add(PazadaDriversHistoryModel.fromSnapshot(pazadadriverhistory));
        }
        return pazadadrivershistorys;
      });
}
