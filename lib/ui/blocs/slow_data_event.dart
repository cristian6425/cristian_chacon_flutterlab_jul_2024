part of 'slow_data_bloc.dart';

abstract class SlowDataEvent extends Equatable {
  const SlowDataEvent();
  @override
  List<Object?> get props => [];
}

class GetSlowData extends SlowDataEvent {}

class GetPaginatedSlowData extends SlowDataEvent {
  const GetPaginatedSlowData({required this.index});

  final int index;

  @override
  List<Object?> get props => [index];
}
