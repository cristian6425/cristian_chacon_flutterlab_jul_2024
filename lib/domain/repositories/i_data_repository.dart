import 'package:prueba_tecnica_2024/domain/models/slow_data_model.dart';

abstract class IDataRepository {
  Future<List<SlowDataModel>> getPaginatedSlowData(String? nextToken);
}
