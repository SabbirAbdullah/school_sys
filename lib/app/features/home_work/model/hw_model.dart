class HomeWorkModel {
  final String subject;
  final String description;
  final String status;

  HomeWorkModel({required this.subject, required this.description, required this.status});

  factory HomeWorkModel.fromJson(Map<String, dynamic> json) {
    return HomeWorkModel(
      subject: json['subject'],
      description: json['description'],
      status: json['status'],
    );
  }
}
