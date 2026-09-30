import '../model/event_news_model.dart';


abstract class EventNewsState {}

class EventNewsInitial extends EventNewsState {}

class EventNewsLoaded extends EventNewsState {
  final List<EventNewsModel> newsList;
  EventNewsLoaded(this.newsList);
}
