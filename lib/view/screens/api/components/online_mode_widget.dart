import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nt/blocs/api_bloc/api_bloc.dart';
import 'package:nt/view/screens/api/components/build_card_widget.dart';
import 'package:nt/view/screens/api/components/offline_mode_widget.dart';

class OnlineModeWidget extends StatelessWidget {
  const OnlineModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ApiBloc, ApiState>(
      listener: (context, state) {
        if (state is ApiError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? ""),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ApiInitial) {
          return _buildLoading();
        } else if (state is ApiLoading) {
          return _buildLoading();
        } else if (state is ApiLoaded) {
          return BuildCardWidget(model: state.apiModel);
        } else if (state is ApiError) {
          return OfflineModeWidget();
        } else {
          return OfflineModeWidget();
        }
      },
    );
  }

  Widget _buildLoading() => const Center(
        child: CircularProgressIndicator(),
      );
}
