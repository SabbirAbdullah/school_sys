abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final String userName;
  final String userImage;
  final List<String> recentUpdates;

  DashboardLoaded({
    required this.userName,
    required this.userImage,
    required this.recentUpdates,
  });
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError(this.message);
}
