import 'package:image_picker/image_picker.dart';

class ComplainFormState {
  final String date;
  final String complainType;
  final String description;
  final XFile? image;
  final bool isChecked;
  final bool isSubmitting;
  final bool isSuccess;
  final String errorMessage;

  ComplainFormState({
    this.date = '',
    this.complainType = '',
    this.description = '',
    this.image,
    this.isChecked = false,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage = '',
  });

  ComplainFormState copyWith({
    String? date,
    String? complainType,
    String? description,
    XFile? image,
    bool? isChecked,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
  }) {
    return ComplainFormState(
      date: date ?? this.date,
      complainType: complainType ?? this.complainType,
      description: description ?? this.description,
      image: image ?? this.image,
      isChecked: isChecked ?? this.isChecked,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
