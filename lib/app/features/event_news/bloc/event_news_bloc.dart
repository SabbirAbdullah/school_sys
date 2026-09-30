import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/features/event_news/model/event_news_model.dart';
import 'event_news_event.dart';
import 'event_news_state.dart';

class EventNewsBloc extends Bloc<EventNewsEvent, EventNewsState> {
  EventNewsBloc() : super(EventNewsInitial()) {
    on<LoadEventNews>((event, emit) {
      final staticData = [
        EventNewsModel(
          name: "Annual Sports Day",
          description: "Join us for a day full of fun and games!",
          imageLink: "/images/sports.jpg",
          fromData: "2025-05-01",
        ),
        EventNewsModel(
          name: "Science Fair",
          description: "Students showcase their creativity and innovation.",
          imageLink: "/images/science_fair.jpg",
          fromData: "2025-05-10",
        ),
      ];
      emit(EventNewsLoaded(staticData));
    });
  }
}
