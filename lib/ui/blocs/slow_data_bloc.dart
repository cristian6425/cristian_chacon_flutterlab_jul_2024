import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba_tecnica_2024/config/constants.dart';
import 'package:prueba_tecnica_2024/domain/use_cases/slow_data_use_case.dart';
import 'package:prueba_tecnica_2024/ui/view_models/slow_data_view_model.dart';
import 'package:prueba_tecnica_2024/utils/status_enum.dart';

part 'slow_data_event.dart';
part 'slow_data_state.dart';

class SlowDataBloc extends Bloc<SlowDataEvent, SlowDataState> {
  final SlowDataUseCase _slowDataUseCase;

  SlowDataBloc({
    required SlowDataUseCase slowDataUseCase,
  })  : _slowDataUseCase = slowDataUseCase,
        super(const SlowDataState()) {
    on<GetSlowData>(_onGetSlowData, transformer: droppable());
    on<GetPaginatedSlowData>(_onGetPaginatedSlowData, transformer: sequential());
  }

  _onGetSlowData(GetSlowData event, Emitter<SlowDataState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));
    try {
      Stopwatch stopwatch = Stopwatch()..start();
      final data = await _slowDataUseCase.getSlowData();
      emit(state.copyWith(data: data, status: StatusEnum.success));
      stopwatch.stop();
      print('Slow data fetched in ${stopwatch.elapsedMilliseconds} ms');
    } catch (e) {
      emit(state.copyWith(status: StatusEnum.failure));
    }
  }

  _onGetPaginatedSlowData(GetPaginatedSlowData event, Emitter<SlowDataState> emit) async {
    if (event.index != state.data.length - Constants.paginationRefreshLimit) {
      return;
    }
    Stopwatch stopwatch = Stopwatch()..start();
    emit(state.copyWith(paginateStatus: StatusEnum.loading));
    try {
      final data = await _slowDataUseCase.getPaginatedSlowData(state.data);
      emit(state.copyWith(data: data, paginateStatus: StatusEnum.success));
    } catch (e) {
      emit(state.copyWith(paginateStatus: StatusEnum.failure));
    }
    stopwatch.stop();
    print('Paginated slow data fetched in ${stopwatch.elapsedMilliseconds} ms');
  }
}
