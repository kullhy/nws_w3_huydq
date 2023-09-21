part of 'bottom_bar_cubit.dart';

class BottomBarState extends Equatable {
  final LoadStatus loadDataStatus;
  final int curIndex;

  const BottomBarState({
    this.loadDataStatus = LoadStatus.initial,
    required this.curIndex,
  });

  @override
  List<Object?> get props => [
        loadDataStatus,
      ];

  BottomBarState copyWith({
    LoadStatus? loadDataStatus,
  int? curIndex,
  }) {
    return BottomBarState(
      loadDataStatus: loadDataStatus ?? this.loadDataStatus,
      curIndex: curIndex?? this.curIndex,
    );
  }
}
