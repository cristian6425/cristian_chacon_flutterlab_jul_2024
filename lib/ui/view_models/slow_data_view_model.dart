import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_2024/domain/models/slow_data_model.dart';

class SlowDataViewModel extends Equatable {
  final String id;
  final String name;

  const SlowDataViewModel({
    required this.id,
    required this.name,
  });

  SlowDataViewModel.fromSlowDataModel(SlowDataModel slowDataModel)
      : id = slowDataModel.id,
        name = slowDataModel.name;

  @override
  List<Object?> get props => [id, name];
}
