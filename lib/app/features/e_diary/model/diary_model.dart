class DiaryModel {
  final String subject;
  final String description;

  DiaryModel({required this.subject, required this.description});

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    return DiaryModel(
      subject: json['subject'],
      description: json['description'],
    );
  }
}
