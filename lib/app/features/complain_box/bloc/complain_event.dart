abstract class ComplainEvent {}

class FetchComplains extends ComplainEvent {}

class DeleteComplain extends ComplainEvent {
  final int id;
  DeleteComplain(this.id);
}

class ToggleExpandCard extends ComplainEvent {
  final int id;
  ToggleExpandCard(this.id);
}
