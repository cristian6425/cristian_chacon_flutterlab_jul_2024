import 'package:prueba_tecnica_2024/domain/repositories/i_data_repository.dart';
import 'package:prueba_tecnica_2024/ui/view_models/slow_data_view_model.dart';

class SlowDataUseCase {
  final IDataRepository _repository;

  SlowDataUseCase({required IDataRepository repository}) : _repository = repository;

  Future<List<SlowDataViewModel>> getSlowData() async {
    final remoteData = await _repository.getPaginatedSlowData(null);
    return remoteData.map((e) => SlowDataViewModel.fromSlowDataModel(e)).toList();
  }

  Future<List<SlowDataViewModel>?> getPaginatedSlowData(List<SlowDataViewModel> data) async {
    final remoteDate = await _repository.getPaginatedSlowData(data.last.id);
    List<SlowDataViewModel> newData = remoteDate.map((e) => SlowDataViewModel.fromSlowDataModel(e)).toList();
    return [...data, ...newData];
  }
}
