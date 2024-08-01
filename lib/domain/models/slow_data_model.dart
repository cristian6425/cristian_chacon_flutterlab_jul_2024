import 'package:equatable/equatable.dart';

class SlowDataModel extends Equatable {
  final String id;
  final String name;

  const SlowDataModel({required this.id, required this.name});

  SlowDataModel.fromJson(Map<String, dynamic> json, String documentId)
      : id = documentId,
        name = json['name'] ?? '';

  @override
  List<Object?> get props => [id, name];
}
