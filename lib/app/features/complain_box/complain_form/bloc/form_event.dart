import 'package:image_picker/image_picker.dart';

abstract class ComplainFormEvent {}

class DateChanged extends ComplainFormEvent {
  final String date;
  DateChanged(this.date);
}

class ComplainTypeChanged extends ComplainFormEvent {
  final String type;
  ComplainTypeChanged(this.type);
}

class DescriptionChanged extends ComplainFormEvent {
  final String description;
  DescriptionChanged(this.description);
}

class ImagePicked extends ComplainFormEvent {
  final XFile image;
  ImagePicked(this.image);
}

class CheckboxToggled extends ComplainFormEvent {
  final bool isChecked;
  CheckboxToggled(this.isChecked);
}

class SubmitComplain extends ComplainFormEvent {}
