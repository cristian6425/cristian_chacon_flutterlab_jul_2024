import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prueba_tecnica_2024/config/constants.dart';
import 'package:prueba_tecnica_2024/domain/models/slow_data_model.dart';
import 'package:prueba_tecnica_2024/domain/repositories/i_data_repository.dart';

class FirestoreRepository extends IDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<List<SlowDataModel>> getPaginatedSlowData(String? nextToken) async {
    var collectionRef = _firestore.collection(Constants.collectionName);
    var db = collectionRef.limit(Constants.paginationLimit);

    if (nextToken != null) {
      final documentRef = await collectionRef.doc(nextToken).get(const GetOptions(source: Source.serverAndCache));
      db = db.startAfterDocument(documentRef);
    }

    final data = await db.get(const GetOptions(source: Source.serverAndCache));
    return List<SlowDataModel>.from(data.docs.map((e) => SlowDataModel.fromJson(e.data(), e.id)));
  }
}
