import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_2024/config/constants.dart';
import 'package:prueba_tecnica_2024/ui/blocs/slow_data_bloc.dart';
import 'package:prueba_tecnica_2024/ui/widgets/circular_indicator_with_state.dart';
import 'package:prueba_tecnica_2024/ui/widgets/refresh_button_widget.dart';
import 'package:prueba_tecnica_2024/ui/widgets/slow_data_item_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final slowDataBloc = context.read<SlowDataBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appTitle),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          slowDataBloc.add(GetSlowData());
        },
        child: BlocBuilder<SlowDataBloc, SlowDataState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status.isSuccess) {
              if (state.data.isEmpty) {
                return RefreshButtonWidget(tittle: Constants.noDataFound, onPressed: () => slowDataBloc.add(GetSlowData()));
              }
              return ListView.builder(
                itemCount: state.data.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.data.length) {
                    return CircularIndicatorWithState(state: state.paginateStatus);
                  }
                  slowDataBloc.add(GetPaginatedSlowData(index: index));
                  final data = state.data[index];
                  return SlowDataItemWidget(data: data);
                },
              );
            } else if (state.status.isFailure) {
              return RefreshButtonWidget(tittle: Constants.failedToFetchData, onPressed: () => slowDataBloc.add(GetSlowData()));
            } else {
              return RefreshButtonWidget(tittle: Constants.noDataFound, onPressed: () => slowDataBloc.add(GetSlowData()));
            }
          },
        ),
      ),
    );
  }
}
