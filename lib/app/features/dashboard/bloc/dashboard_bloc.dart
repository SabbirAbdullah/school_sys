import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<LoadDashboardData>((event, emit) async {
      emit(DashboardLoading());

      try {
        // Simulate fetching data
        await Future.delayed(Duration(seconds: 1));
        emit(DashboardLoaded(
          userName: "Sabbir Abdullah",
          userImage: "assets/user.png", // Place your image in assets
          recentUpdates: ["New classwork added", "Homework updated"],
        ));
      } catch (e) {
        emit(DashboardError("Failed to load data."));
      }
    });
  }
}
