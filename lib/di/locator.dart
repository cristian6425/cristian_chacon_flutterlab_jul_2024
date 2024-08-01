import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_2024/data/repositories/firestore_repository.dart';
import 'package:prueba_tecnica_2024/domain/use_cases/slow_data_use_case.dart';
import 'package:prueba_tecnica_2024/ui/blocs/slow_data_bloc.dart';

class LocatorDi {
  static get instance => [
        BlocProvider(create: (_) => SlowDataBloc(slowDataUseCase: SlowDataUseCase(repository: FirestoreRepository()))..add(GetSlowData())),
      ];
}
