import 'package:flutter/material.dart';
import 'package:prueba_tecnica_2024/ui/view_models/slow_data_view_model.dart';
import 'package:prueba_tecnica_2024/utils/widget_extension.dart';

class SlowDataItemWidget extends StatelessWidget {
  const SlowDataItemWidget({super.key, required this.data});
  final SlowDataViewModel data;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: context.colorScheme.onPrimary,
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.name, style: context.textTheme.titleMedium),
              Text(data.id, style: context.textTheme.bodySmall),
            ],
          ),
        ));
  }
}
