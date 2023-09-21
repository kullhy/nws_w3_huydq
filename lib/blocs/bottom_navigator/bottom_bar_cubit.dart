import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nws_w3_huydq/models/enums/load_status.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit()
      : super(const BottomBarState(
            curIndex: 0, loadDataStatus: LoadStatus.success));

  Future<void> loadInitialData(int index) async {
    log(index.toString());
    emit(state.copyWith(loadDataStatus: LoadStatus.loading));
    emit(state.copyWith(loadDataStatus: LoadStatus.success, curIndex: index));

    // emit(state.copyWith(loadDataStatus: LoadStatus.failure));
  }
}
