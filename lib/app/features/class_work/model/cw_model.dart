class ClassWorkModel {
  final String subject;
  final String description;
  final String status;

  ClassWorkModel({required this.subject, required this.description, required this.status});

  factory ClassWorkModel.fromJson(Map<String, dynamic> json) {
    return ClassWorkModel(
      subject: json['subject'],
      description: json['description'],
      status: json['status'],
    );
  }
}
