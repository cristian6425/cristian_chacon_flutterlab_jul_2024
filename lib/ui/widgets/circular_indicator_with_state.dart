import 'package:flutter/material.dart';
import 'package:prueba_tecnica_2024/utils/status_enum.dart';

class CircularIndicatorWithState extends StatelessWidget {
  const CircularIndicatorWithState({super.key, required this.state});
  final StatusEnum state;

  @override
  Widget build(BuildContext context) {
    return state.isLoading
        ? Center(
            child: Container(margin: const EdgeInsets.only(top: 10, bottom: 10), child: const CircularProgressIndicator()),
          )
        : Container();
  }
}
