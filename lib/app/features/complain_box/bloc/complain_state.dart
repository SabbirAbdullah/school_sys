import '../model/complain_model.dart';

class ComplainState {
  final bool isLoading;
  final String errorMessage;
  final List<ComplainModel> complainList;
  final Set<int> expandedCardIds;

  ComplainState({
    this.isLoading = false,
    this.errorMessage = '',
    this.complainList = const [],
    this.expandedCardIds = const {},
  });

  ComplainState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<ComplainModel>? complainList,
    Set<int>? expandedCardIds,
  }) {
    return ComplainState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      complainList: complainList ?? this.complainList,
      expandedCardIds: expandedCardIds ?? this.expandedCardIds,
    );
  }
}
