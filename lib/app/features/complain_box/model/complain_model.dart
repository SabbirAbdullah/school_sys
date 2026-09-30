class ComplainRepository {
  static Future<List<ComplainModel>> getComplains() async {
    await Future.delayed(Duration(seconds: 1)); // simulate loading delay

    return [
      ComplainModel(
        id: 1,
        complainType: 'Classroom Issue',
        complainDes: 'The projector is not working properly and the fan is broken.',
        img: 'sample_image1.jpg',
        phone: '01700000001',
        date: '2025-05-12T14:30:00',
      ),
      ComplainModel(
        id: 2,
        complainType: 'Food Complaint',
        complainDes: 'The lunch served today was stale and smelled bad.',
        img: 'sample_image2.jpg',
        phone: '01700000002',
        date: '2025-05-11T12:00:00',
      ),
      ComplainModel(
        id: 3,
        complainType: 'Transport Delay',
        complainDes: 'The school bus has been arriving 20 minutes late all week.',
        img: 'sample_image3.jpg',
        phone: '01700000003',
        date: '2025-05-10T08:15:00',
      ),
    ];
  }

  static Future<void> deleteComplain(int id) async {
    await Future.delayed(Duration(milliseconds: 500));
    print("Deleted complain with id: $id"); // simulate deletion
  }
}

class ComplainModel {
  final int id;
  final String? complainType;
  final String? complainDes;
  final String? img;
  final String? phone;
  final String? date;

  ComplainModel({
    required this.id,
    this.complainType,
    this.complainDes,
    this.img,
    this.phone,
    this.date,
  });
}

