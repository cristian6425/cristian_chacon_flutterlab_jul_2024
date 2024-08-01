part of 'slow_data_bloc.dart';

class SlowDataState extends Equatable {
  final StatusEnum status;
  final StatusEnum paginateStatus;
  final List<SlowDataViewModel> data;

  const SlowDataState({
    this.status = StatusEnum.initial,
    this.paginateStatus = StatusEnum.initial,
    this.data = const [],
  });

  SlowDataState copyWith({StatusEnum? status, StatusEnum? paginateStatus, List<SlowDataViewModel>? data}) {
    return SlowDataState(status: status ?? this.status, paginateStatus: paginateStatus ?? this.paginateStatus, data: data ?? this.data);
  }

  @override
  List<Object?> get props => [status, paginateStatus, data];
}
